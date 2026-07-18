# Домашнее задание к занятию «Введение в Terraform»

### Чек-лист готовности к домашнему заданию

Приложите скриншот вывода команды ```terraform --version```.
<img width="653" height="369" alt="1_1" src="https://github.com/user-attachments/assets/6d95536c-355d-4191-b812-e0181455aaf5" />


### Задание 1

Q: Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)
A: personal.auto.tfvars

Q: Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.
A: name: random_string | result: jkEFGjhJ8ET6EUfA

Q: Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду terraform validate. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.
A: Error: Missing name for resource "docker_image" - отсутствует имя ресурса
 Error: Invalid resource name "docker_container" "1nginx": -имя не может начинаться с цифры
 random_string_FAKE" has not been declared in the root module - тип необьявлен
 
Q: Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды docker ps.
A: roman@UbuntuS4:~/02_Terraform/ter-homeworks/01/src$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                  NAMES
4f5b40e75518   ec4ed8b5299e   "/docker-entrypoint.…"   20 seconds ago   Up 20 seconds   0.0.0.0:9090->80/tcp   example_jkEFGjhJ8ET6EUfA

...
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx1" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string.result}"

  ports {
    internal = 80
    external = 9090
  }
}

Q: Замените имя docker-контейнера в блоке кода на hello_world. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду terraform apply -auto-approve. Объясните своими словами, в чём может быть опасность применения ключа -auto-approve. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды docker ps.
A: Пытаемся создать ресурс, который уже был создан ранее., опасно так4 как нет возможности подтвердить самостоятельно.
│ Error: Unable to create container: Error response from daemon: Conflict. The container name "/example_jkEFGjhJ8ET6EUfA" is already in use by container "4f5b40e75518fa9715e71ae5a7dd31e52c1d8434a02383e2c5cdc34d68bd9600". You have to remove (or rename) that container to be able to reuse that name.
│ 
│   with docker_container.hello_world,
│   on main.tf line 28, in resource "docker_container" "hello_world":
│   28: resource "docker_container" "hello_world" {

roman@UbuntuS4:~/02_Terraform/ter-homeworks/01/src: docker ps 
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
 roman@UbuntuS4:~/02_Terraform/ter-homeworks/01/src:


Q: Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.
A: {
  "version": 4,
  "terraform_version": "1.15.7",
  "serial": 10,
  "lineage": "4c3a4a41-c4a3-74a8-47f9-e42840ce6529",
  "outputs": {},
  "resources": [],
  "check_results": null
}

Q: Объясните, почему при этом не был удалён docker-образ nginx:latest. Ответ ОБЯЗАТЕЛЬНО НАЙДИТЕ В ПРЕДОСТАВЛЕННОМ КОДЕ, а затем ОБЯЗАТЕЛЬНО ПОДКРЕПИТЕ строчкой из документации terraform провайдера docker. (ищите в классификаторе resource docker_image )
A: ..  keep_locally = true..
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.


### Правила приёма работы

Домашняя работа оформляется в отдельном GitHub-репозитории в файле README.md.   
Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории

