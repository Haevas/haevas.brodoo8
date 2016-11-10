Rol Ansible para instalação do Odoo 8 na localização brasileira
===

[![Build Status](http://img.shields.io/travis/Haevas/Haevas.brodoo8.svg?style=flat-square)](https://travis-ci.org/Haevas/Haevas.brodoo8)
[![Galaxy](http://img.shields.io/badge/galaxy-Haevas.brodoo8-blue.svg?style=flat-square)](https://galaxy.ansible.com/Haevas/brodoo8/)


#### Requisitos e dependências

Veja o arquivo [requirements.yml](requirements.yml) para a lista completa
de dependências.


#### Versões

Fizemos testes do rol do Ansible nas seguintes versões de sistemas operacionais.

| OS            | Odoo 8.0 |
|---------------|----------|
| Ubuntu 12.04  | -        |
| Ubuntu 14.04  | sim      |
| Ubuntu 16.04  | não      |
| Debian 7      | -        |
| Debian 8      | -        |


#### Variáveis

O arquivo [defaults/main.yml](defaults/main.yml) contem uma lista das
variáveis e valores padrão usados.


#### Instalação

Na pasta bootstrap tem varios scripts.

- `guest-ubuntu-14.04-setup-dependencies.sh`: Instala as dependências
  (basicamente instala a ultima versão do Ansible), esse seria o passo inicial.
- `guest-ubuntu-14.04-run-ansible-all-tags.sh`: Executa o playbook de Ansible.
   Podem ser executadas so determinadas tags, por exemplo o script
   `guest-ubuntu-14.04-run-ansible-tag-01-os-packages.sh` so ira instalar os
   pacotes do sistema operacional, e assim por diante. Estes scripts estao
   numerados conforme a ordem de execucao caso seja necessario executa-los
   manualmente
- Existe um script que agrupa os dois anteriores: `guest-ubuntu-14.04-run-all.sh`


#### Uso

Adicione `Haevas.brodoo` aos seus roles e habilite o modulo.

```yaml
- hosts: all

  roles:
  - Haevas.brodoo8

  vars:
    # -- coloque as suas variaveis aqui --
```


#### Contribua

Issues, features, e ideias são
[bem-vindas](https://github.com/Haevas/Haevas.brodoo/issues). Para enviar um PR
(pull request) por favor crie a sua própria branch e faca squash dos seus
commits em um só com uma mensagem descritiva antes de submeter seu PR.

Esse e mais ou menos o meu fluxo de desenvolvimento:

1. Instalar o plugin de snaphosts do vagrant

    ```sh
    user@host:~/odoo/haevas.brodoo $ vagrant plugin install vagrant-multiprovider-snap
    ```
1. Levantar uma VM no vagrant

    ```sh
    user@host:~/odoo/haevas.brodoo $ vagrant up
    user@host:~/odoo/haevas.brodoo $ vagrant ssh
    vagrant@brodoo:~$ cd /vagrant/odoo/haevas.brodoo/bootstrap/ubuntu-14.04
    vagrant@brodoo:/vagrant/odoo/haevas.brodoo/bootstrap$ ./guest-ubuntu-14.04-setup-dependencies.sh
    vagrant@brodoo:/vagrant/odoo/haevas.brodoo/bootstrap$ ./guest-ubuntu-14.04-run-ansible-tag-01-os-packages.sh
    vagrant@brodoo:/vagrant/odoo/haevas.brodoo/bootstrap$ ./guest-ubuntu-14.04-run-ansible-tag-02-pip-packages.sh
    ```
1. Criar um snapshot no vagrant. E possível depois continuar desde aqui caso seja necessário

    ```sh
    user@host:~/odoo/haevas.brodoo $ vagrant snapshot save deps
    ```
1. Continuar com a instalação

    ```sh
    user@host:~/odoo/haevas.brodoo $ vagrant ssh
    vagrant@brodoo:~$ cd /vagrant/odoo/haevas.brodoo/bootstrap/ubuntu-14.04
    vagrant@brodoo:/vagrant/odoo/haevas.brodoo/bootstrap$ ./guest-ubuntu-14.04-run-ansible-tag-03-database.sh
    vagrant@brodoo:/vagrant/odoo/haevas.brodoo/bootstrap$ ./guest-ubuntu-14.04-run-ansible-tag-04-odoo.sh
    vagrant@brodoo:/vagrant/odoo/haevas.brodoo/bootstrap$ ./guest-ubuntu-14.04-run-ansible-tag-05-addons.sh
    ```


#### Licença

Veja a LICENSE para maiores detalhes.


<!--  vim: set spell: -->
<!--  vim: set spelllang=pt_BR: -->
