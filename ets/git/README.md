# Apuntes sobre GIT

## Instalación de git y configuración

    git --version
    
Crea un archivo en ~/.gitconfig:
  
    git config --global user.name "Sergio Delgado Quintero"

    git config --global user.email "sdelquin@gmail.com"
  
  [user]
  
  name = Sergio Delgado Quintero
    
  email = sdelquin@gmail.com
    
Rama principal por defecto:

    git config --global init.defaultBranch main 
    
Añade a ~/.gitconfig:

   [init]
   
   defaultBranch = main
      
## Inicializar un repositorio

    git init
   
  Initialized empty Git repository in /Users/sdelquin/work/.git/
      
## Clonar un repositorio
 
Vía ssh:

    git clone git@github.com:sdelquin/work.git
  
Vía https:

    git clone https://github.com/sdelquin/work.git

## Flujo de trabajo

Crear rama de desarrollo:

        git switch -c dev

Ver el estado del repo:

        git status

Preparar los cambios:

        git add .
        
Confirmar los cambios:        

        git commit -m "First commit"

Subir cambios al servicio web:
        
        git push
        
## Comandos en detalle

![image](https://user-images.githubusercontent.com/115082160/205445016-fa38bd39-5b83-44d8-b7c6-99f9c6b6360b.png)

ignored ⇒ ignorado

tracked ⇒ con seguimiento

untracked ⇒ sin seguimiento

modified ⇒ modificado

staged ⇒ preparado

    git add → preparar

committed ⇒ confirmado

    git commit → confirmar
 
Se puede hacer un commit junto con un add si es para archivos con seguimiento:
    
        git commit -am "Fast"
        
Me olvidé de incluir un cambio en el último commit:

        git commit --amend

Opción que deja el antiguo commit desatendido:

        git commit --amend --no-edit
        
El CTRL-Z de toda la vida:

Escenario 1: Hemos modificado README.md pero está aún sin preparar:

        git restore README.md

Escenario 2: Hemos modificado README.md y lo hemos preparado:

        git restore --staged README.md
        
        git restore README.md
        
Borrando archivos sin seguimiento:

        git clean -i
        
Se abre un menú:
        
Would remove the following items:
 
 process.C  upload.C

*** Commands ***
  
  1: clean                2: filter by pattern
  
  3: select by numbers    4: ask each
  
  5: quit                 6: help

What now> 4

Remove process.C [y/N]? y

Remove upload.C [y/N]? y

Removing process.C

Removing upload.C

Hay otros modificadores, como forzar el borrado:

        git clean -f
        
## Ramas

![image](https://user-images.githubusercontent.com/115082160/205448421-8d1c4400-43e0-4fa6-85b9-a33d42fc5fa8.png)

Ramas locales:

        git branch

Ramas remotas:

        git branch -r 
        
Todas las ramas:

        git branch -a
        
Todos los detalles:

        git branch -avv

Crear ramas:

        git branch dev
        
Borrar ramas:

        git branch -d dev
        
Ver origen remoto:

        git remote -v
    
Para modificar los remotos:

        git remote add
        
        git remote remove
        
Tambien podría editar el .git/config ...

Mostrar rama actual:

        git branch
        
Crear nueva rama y moverme a ella:

        git switch -c blue
        
Para volver a la rama anterior:

        git switch -

Para subir los cambios upstream:

        git push
        
Si no hay rama correspondiente upstream, hay que crearla:

        git push -u origin dev
        
Son equivalentes:   -u ⇔ --set-upstream  

Mezclando cambios en otra rama:

        git merge dev 

Para bajar a local los cambios en remoto:

        git pull
        
El comando git fetch descarga commits, archivos y referencias de un repositorio remoto a tu repositorio local:
        
        git fetch
        
El resto aún no lo hemos visto en clase...

        
## Repositorios de Joathan

Volver a un estado anterior desde remoto:

        git fetch origin
        
        git reset --hard <nombre_rama_remota>
        
Historial del repositoriio:

Ver el estado:

        git status
        
Ver historial de commits:

        git log oneline/graph

Mostrar información de un commit concreto:

        git show <commit>
        
 Mostrar el historial de cambios de un fichero:
 
        git annotate
        
Mostrar las diferencias entre versiones:

   - muestra las diferencias entre el directorio de trabajo y la zona de intercambio temporal:
        
            git diff 
   
   - muestra las diferencias entre la zona de intercambio temporal y el último commit:
   
            dit diff --cached 
            
   - muestra la diferencia entre el directorio de trabajo y el último commit:
            
            git diff HEAD  
        
