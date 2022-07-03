#!/bin/bash

echo "\nPlease insert your project name: "
read input_variable

curl -s "https://laravel.build/$input_variable" | bash

cd $input_variable 

# Install extra composer packages
composer require darkaonline/l5-swagger
composer require kirschbaum-development/laravel-openapi-validator --dev
composer require nunomaduro/larastan --dev
composer require barryvdh/laravel-debugbar --dev
composer require barryvdh/laravel-ide-helper --dev

# Generate config
php artisan key:generate


# Update Readme file

# github workflow file and config
mkdir -p .github/workflows
touch .github/workflows/ci.yaml
#todo fill the config file


mkdir -p app/Http/Controllers/Api/V1


# install quality tools , php-cs-fixer, etc ...

# change default port from 8080

# Add transformers and adapter


# Start sail
./vendor/bin/sail up -d
./vendor/bin/sail artisan key:generate

