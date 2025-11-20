# Folder Reorganization Script
# This script reorganizes the Flutter project structure

$ErrorActionPreference = "SilentlyContinue"

Write-Host "Starting folder reorganization..." -ForegroundColor Green

# Move widgets to organized structure
Write-Host "Organizing widgets..." -ForegroundColor Yellow
Move-Item -Path "lib/core/widgets/loading_states.dart" -Destination "lib/core/widgets/loading/" -Force
Move-Item -Path "lib/core/widgets/empty_states.dart" -Destination "lib/core/widgets/empty/" -Force
Move-Item -Path "lib/core/widgets/lazy_load_list.dart" -Destination "lib/core/widgets/common/" -Force

# Move utils
Write-Host "Organizing utils..." -ForegroundColor Yellow
Move-Item -Path "lib/core/utils/image_cache_manager.dart" -Destination "lib/core/utils/" -Force
Move-Item -Path "lib/core/utils/pagination_helper.dart" -Destination "lib/core/utils/" -Force

# Move services to organized structure
Write-Host "Organizing services..." -ForegroundColor Yellow
Move-Item -Path "lib/core/services/validation_service.dart" -Destination "lib/shared/services/" -Force
Move-Item -Path "lib/core/services/order_service.dart" -Destination "lib/features/orders/data/services/" -Force -ErrorAction SilentlyContinue
Move-Item -Path "lib/core/services/notification_service.dart" -Destination "lib/features/notifications/data/services/" -Force -ErrorAction SilentlyContinue
Move-Item -Path "lib/core/services/search_service.dart" -Destination "lib/features/search/data/services/" -Force -ErrorAction SilentlyContinue

# Move payment services
Write-Host "Organizing payment services..." -ForegroundColor Yellow
New-Item -ItemType Directory -Force -Path "lib/features/payment/data/services/gateways" | Out-Null
Move-Item -Path "lib/core/services/payment/*" -Destination "lib/features/payment/data/services/gateways/" -Force -ErrorAction SilentlyContinue

# Move exceptions to errors
Write-Host "Organizing errors..." -ForegroundColor Yellow
Move-Item -Path "lib/core/exceptions/*" -Destination "lib/core/errors/" -Force

# Rename router folder
Write-Host "Organizing router..." -ForegroundColor Yellow
Move-Item -Path "lib/core/router" -Destination "lib/app/router" -Force -ErrorAction SilentlyContinue

Write-Host "Folder reorganization complete!" -ForegroundColor Green
Write-Host "Note: Some moves may have failed if directories don't exist yet." -ForegroundColor Cyan
