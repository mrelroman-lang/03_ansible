# [Домашнее задание к занятию «Основы Terraform. Yandex Cloud»

## Задание 1

4. Ошибки:

* Unsupported Terraform Core version? указано > 1.12.0 а в системе  1.15.8
* Error while requesting API to create network code = PermissionDenied desc = Operation is not permitted in the folder > нужны дополнительные права для создания сети editor
*  ResourceExhausted desc = Quota limit vpc.networks.count exceeded > default  подсеть удалил
*  Платформа v4 недоступна в зоне ru-central1-a, доступны v1, v2, v3:
* опечатка в слове standarT, надо standatD
* Error: Error while requesting API to create instance: the specified core fraction is not available on platform "standard-v3"; allowed core fractions: 20, 50, 100 , выбрал v1

Результат: 
<img width="959" height="1270" alt="Terraform_02_1_1" src="https://github.com/user-attachments/assets/85679c89-93de-4558-b879-f6f853a3cac4" />


5. Подключение через ssh:
<img width="747" height="261" alt="Terraform_02_1_2" src="https://github.com/user-attachments/assets/5d3bdb4d-c93d-4f41-a56d-739903981baf" />

6. Параметры `preemptible = true` и `core_fraction=5` нужны для экономии средств на счету.

## Задание 2

1. Использование переменных 
<img width="1830" height="298" alt="Terraform_02_2_3" src="https://github.com/user-attachments/assets/d6be32a4-9606-4207-b2e2-e50992dc6c46" />

## Задание 3
<img width="1418" height="283" alt="Terraform_02_2_1" src="https://github.com/user-attachments/assets/483e9132-b631-47bd-b050-e4e13e5bad65" />

## Задание 4
<img width="804" height="294" alt="Terraform_02_2_4" src="https://github.com/user-attachments/assets/e5e394f6-371e-4304-87e7-acaf72ca0274" />


[output.tf](./src/outputs.tf)

## Задание 5
<img width="1128" height="980" alt="Terraform_02_2_5" src="https://github.com/user-attachments/assets/6c6181e9-1fba-4218-939d-307fc8107b5d" />

## Задание 6
<img width="1300" height="953" alt="Terraform_02_2_6" src="https://github.com/user-attachments/assets/4815ee5a-f7a3-4dad-84b0-c4363f09d2d1" />
