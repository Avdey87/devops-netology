# devops-netologynew string

## Игнорируемые файлы

В папке `terraform/` файл `.gitignore` исключает из репозитория:
- `.terraform/` — служебная директория с провайдерами и модулями;
- `*.tfstate`, `*.tfstate.*` — файлы состояния Terraform;
- `*.tfvars` — файлы с переменными (могут содержать секреты);
- `crash.log`, `override.tf`, `.terraformrc` — служебные и локальные файлы.

Изменение из ветки fix
