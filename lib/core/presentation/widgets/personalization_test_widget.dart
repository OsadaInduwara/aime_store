// lib/core/presentation/widgets/personalization_test_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/personalization_test_service.dart';

/// Widget to test personalization system - only for development
class PersonalizationTestWidget extends ConsumerStatefulWidget {
  const PersonalizationTestWidget({super.key});

  @override
  ConsumerState<PersonalizationTestWidget> createState() => _PersonalizationTestWidgetState();
}

class _PersonalizationTestWidgetState extends ConsumerState<PersonalizationTestWidget> {
  bool _isRunning = false;
  Map<String, dynamic>? _testResults;
  String _status = 'Ready to test';

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Personalization System Test',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),

            Text(
              'Status: $_status',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),

            if (_isRunning)
              const LinearProgressIndicator()
            else
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _runTests,
                    child: const Text('Run Full Test'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _runQuickCheck,
                    child: const Text('Quick Check'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _clearTestData,
                    child: const Text('Clear Test Data'),
                  ),
                ],
              ),

            if (_testResults != null) ...[
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              Text(
                'Test Results:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              _buildTestResults(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTestResults() {
    if (_testResults == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final entry in _testResults!.entries)
          if (entry.value is Map<String, dynamic>)
            _buildTestSection(entry.key, entry.value as Map<String, dynamic>)
          else
            Text('${entry.key}: ${entry.value}'),
      ],
    );
  }

  Widget _buildTestSection(String title, Map<String, dynamic> results) {
    final success = results['success'] ?? false;
    final icon = success ? Icons.check_circle : Icons.error;
    final color = success ? Colors.green : Colors.red;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '$title: ${success ? 'PASSED' : 'FAILED'}',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _runTests() async {
    setState(() {
      _isRunning = true;
      _status = 'Running comprehensive tests...';
      _testResults = null;
    });

    try {
      final results = await PersonalizationTestService.runComprehensiveTest();

      setState(() {
        _testResults = results;
        _status = 'Tests completed';
      });
    } catch (e) {
      setState(() {
        _status = 'Tests failed: $e';
      });
    } finally {
      setState(() {
        _isRunning = false;
      });
    }
  }

  Future<void> _runQuickCheck() async {
    setState(() {
      _isRunning = true;
      _status = 'Running quick health check...';
    });

    try {
      final isHealthy = await PersonalizationTestService.quickHealthCheck();

      setState(() {
        _status = isHealthy ? 'System is healthy ✅' : 'System has issues ❌';
        _testResults = {
          'quick_check': {
            'success': isHealthy,
            'message': isHealthy ? 'All systems operational' : 'Some issues detected'
          }
        };
      });
    } catch (e) {
      setState(() {
        _status = 'Quick check failed: $e';
      });
    } finally {
      setState(() {
        _isRunning = false;
      });
    }
  }

  Future<void> _clearTestData() async {
    setState(() {
      _isRunning = true;
      _status = 'Clearing test data...';
    });

    try {
      await PersonalizationTestService.clearTestData();

      setState(() {
        _status = 'Test data cleared';
        _testResults = null;
      });
    } catch (e) {
      setState(() {
        _status = 'Failed to clear test data: $e';
      });
    } finally {
      setState(() {
        _isRunning = false;
      });
    }
  }
}