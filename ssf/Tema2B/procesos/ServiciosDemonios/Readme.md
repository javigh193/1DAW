## Hoja de ejercicios de Servicios y Demonios 

# 1. Muestra todos los servicios de tu sistema

    systemctl list-units --type=service

El siguiente es un fragmento de la salida total a modo de ejemplo:

UNIT                                                  LOAD   ACTIVE SUB     DESCRIPTION                                                     
  accounts-daemon.service                               loaded active running Accounts Service                                                
  acpid.service                                         loaded active running ACPI event daemon                                               
  alsa-restore.service                                  loaded active exited  Save/Restore Sound Card State                                   
  anacron.service                                       loaded active running Run anacron jobs                                                
  apparmor.service                                      loaded active exited  Load AppArmor profiles                                          
  apport.service                                        loaded active exited  LSB: automatic crash report generation                          
  avahi-daemon.service                                  loaded active running Avahi mDNS/DNS-SD Stack                                         
  colord.service                                        loaded active running Manage, Install and Generate Color Profiles                     
  console-setup.service                                 loaded active exited  Set console font and keymap                                     
  cron.service                                          loaded active running Regular background program processing daemon                    
  cups-browsed.service                                  loaded active running Make remote CUPS printers available locally                     
  cups.service                                          loaded active running CUPS Scheduler                                                  
  dbus.service                                          loaded active running D-Bus System Message Bus                                        
  gdm.service                                           loaded active running GNOME Display Manager                                           
  irqbalance.service                                    loaded active running irqbalance daemon                                               
  kerneloops.service                                    loaded active running Tool to automatically collect and submit kernel crash signatures
  keyboard-setup.service                                loaded active exited  Set the console keyboard layout                                 
  kmod-static-nodes.service                             loaded active exited  Create list of static device nodes for the current kernel       
  ModemManager.service                                  loaded active running Modem Manager                                                   
  networkd-dispatcher.service                           loaded active running Dispatcher daemon for systemd-networkd                          
  NetworkManager-wait-online.service                    loaded active exited  Network Manager Wait Online                                     
  NetworkManager.service                                loaded active running Network Manager                                                 
  ntp.service                                           loaded active running Network Time Service                                            
  openvpn.service                                       loaded active exited  OpenVPN service                                                 
  polkit.service                                        loaded active running Authorization Manager                                           
  rsyslog.service                                       loaded active running System Logging Service                                          
  rtkit-daemon.service                                  loaded active running RealtimeKit Scheduling Policy Service                           
  setvtrgb.service                                      loaded active exited  Set console scheme                                              
  snapd.apparmor.service                                loaded active exited  Load AppArmor profiles managed internally by snapd              
  snapd.seeded.service                                  loaded active exited  Wait until snapd is fully seeded                                
  snapd.service                                         loaded active running Snap Daemon                                                     
  switcheroo-control.service                            loaded active running Switcheroo Control Proxy service                                
  systemd-fsck@dev-disk-by\x2duuid-8665\x2d43AC.service loaded active exited  File System Check on /dev/disk/by-uuid/8665-43AC                
  systemd-journal-flush.service                         loaded active exited  Flush Journal to Persistent Storage                             
  systemd-journald.service                              loaded active running Journal Service                                                 
  systemd-logind.service                                loaded active running Login Service                                                   
  systemd-modules-load.service                          loaded active exited  Load Kernel Modules                                             
  systemd-random-seed.service                           loaded active exited  Load/Save Random Seed                                           
  systemd-remount-fs.service                            loaded active exited  Remount Root and Kernel File Systems                            
  systemd-resolved.service                              loaded active running Network Name Resolution                                         
  systemd-sysctl.service                                loaded active exited  Apply Kernel Variables                                          
  systemd-sysusers.service                              loaded active exited  Create System Users                                             
  systemd-tmpfiles-setup-dev.service                    loaded active exited  Create Static Device Nodes in /dev                              
  systemd-tmpfiles-setup.service                        loaded active exited  Create Volatile Files and Directories                           
  systemd-udev-trigger.service                          loaded active exited  udev Coldplug all Devices                                       
  systemd-udevd.service                                 loaded active running udev Kernel Device Manager                                      
  systemd-update-utmp.service                           loaded active exited  Update UTMP about System Boot/Shutdown                          
  systemd-user-sessions.service                         loaded active exited  Permit User Sessions                                            
  udisks2.service                                       loaded active running Disk Manager                                                    
  ufw.service                                           loaded active exited  Uncomplicated firewall                                          
lines 1-51

La alternativa con SysVinit:

usuario@ubuntu-20:~$ service --status-all
 [ + ]  acpid
 [ - ]  alsa-utils
 [ - ]  anacron
 [ + ]  apparmor
 [ + ]  apport
 [ + ]  avahi-daemon
 [ - ]  bluetooth
 [ - ]  console-setup.sh
 [ + ]  cron
 [ + ]  cups
 [ - ]  cups-browsed
 [ + ]  dbus
 [ + ]  gdm3
 [ - ]  grub-common
 [ - ]  hwclock.sh
 [ + ]  irqbalance
 [ + ]  kerneloops
 [ - ]  keyboard-setup.sh
 [ + ]  kmod
 [ + ]  network-manager
 [ + ]  ntp
 [ + ]  openvpn
 [ - ]  plymouth
 [ - ]  plymouth-log
 [ - ]  pppd-dns
 [ + ]  procps
 [ - ]  pulseaudio-enable-autospawn
 [ - ]  rsync
 [ + ]  rsyslog
 [ - ]  saned
 [ - ]  speech-dispatcher
 [ - ]  spice-vdagent
 [ + ]  udev
 [ + ]  ufw
 [ + ]  unattended-upgrades
 [ - ]  uuidd
 [ + ]  whoopsie
 [ - ]  x11-common

# 2. Elige 3 servicios de tu sistema.

    systemctl show cups

    systemctl status cups

● cups.service - CUPS Scheduler
     Loaded: loaded (/lib/systemd/system/cups.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2023-03-09 11:31:05 UTC; 36min left
TriggeredBy: ● cups.socket
             ● cups.path
       Docs: man:cupsd(8)
   Main PID: 887 (cupsd)
      Tasks: 2 (limit: 4613)
     Memory: 2.5M
     CGroup: /system.slice/cups.service
             ├─887 /usr/sbin/cupsd -l
             └─891 /usr/lib/cups/notifier/dbus dbus://

    systemctl is-enabled cups

Warning: some journal files were not opened due to insufficient permissions.
1. Nombre: cups
2. Gestiona las colas de impresión y otros aspectos del proceso de impresión.
3. Está activo
4. Está habilitado
5. Para saber si el servicio está enmascarado se pueden usar los mismos comandos que antes. 
   Para comprobarlo enmascaro el servicio y los lanzo de nuevo. Antes no lo estaba, pero no 
   se indicaba de forma explícita, 'unmasked' por ejemplo. 

    systemctl status cups

● cups.service
     Loaded: masked (Reason: Unit cups.service is masked.)
     Active: active (running) since Thu 2023-03-09 11:31:05 UTC; 30min left
TriggeredBy: ● cups.path
             ● cups.socket
   Main PID: 887 (cupsd)
     CGroup: /system.slice/cups.service
             ├─887 /usr/sbin/cupsd -l
             └─891 /usr/lib/cups/notifier/dbus dbus://

    systemctl is-enabled cups

masked

# 3. ¿Cómo se comunican los servicios?

Los servicios leen su configuración de ficheros alojados en el directorio /etc del sistema (habitualmente). Normalmente sólo cargan dicha configuración al arrancar, por lo que suele ser necesario reiniciarlos para poder aplicar cambios. Existen alternativas como recargas para algunos de ellos.

No suelen usar las entradas y salidas estándar del sistema. Algunos utilizan aplicaciones de tipo cliente ejecutadas por el usuario para comunicarse con éste. Para dejar constancia de errores o registrar mensajes utilizan logs que suelen estar ubicados en /var/log, o bien otros servicios especializados en registros como syslog.

# 4. Tras cambiar la configuración de un servicio nada parece cambiar, ¿qué está ocurriendo?

Los servicios no suelen cambiar su configuración "en caliente". Suelen requerir un reinicio del servicio. Algunos servicios admiten una recarga, que es una alternativa mucho más benigna al reinicio. Systemctl nos brinda el comando 'try-reload-or-restart', que primero comprueba que el servicio esta en ejecución, si lo está, intenta recargarlo, si el servicio no admite esta opción, entonces lo reinicia. 

# 5. ¿Es siempre seguro reiniciar o detener un servicio?

No. Muchos servicios atienden tareas críticas del sistema, existiendo muchas dependencias entre diferentes servicios en ejecución. Se deben tener muy claro que implica detener un servicio concreto antes de hacerlo. Reiniciar el servicio implica su detención, por lo que todo lo anterior sigue aplicando. Como ya se comentó en el punto anterior, lo mejor es intentar otras alternativas como la recarga antes de recurrir a detener un servicio.

# 6. Qué debo hacer para:

1. Consultar el estado de un servicio:

    systemctl status cups

● cups.service - CUPS Scheduler
     Loaded: loaded (/lib/systemd/system/cups.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2023-03-09 11:31:05 UTC; 7min left
TriggeredBy: ● cups.socket
             ● cups.path
       Docs: man:cupsd(8)
   Main PID: 887 (cupsd)
      Tasks: 2 (limit: 4613)
     Memory: 2.5M
     CGroup: /system.slice/cups.service
             ├─887 /usr/sbin/cupsd -l
             └─891 /usr/lib/cups/notifier/dbus dbus://

2. Consultar la configuración de un servicio:

    systemctl show cups

Muestra un listado en el que cada fila contiene clave - valor .Con el modificador '-p [clave]' se puede pedir mostrar el valor del parámetro correspondiente. 

3. Detener el servicio:

    systemctl stop cups

4. Activar un servicio:

    systemctl start cups

5. Reiniciar un servicio:

    sudo systemctl restart cups

6. Reiniciarlo si estava activo:

    sudo systemctl try-restart cups

7. Recargar su configuración:

    sudo systemctl reload cups

8. Recargar su configuración y, si falla, reiniciarlo:

    sudo systemctl reload-or-restart cups

9. Recargar su configuración y, si falla, reiniciarlo, solamente si estava activo:

    sudo systemctl try-reload-or-restart cups

# 7. Activo/inactivo, habilitado/inhabilitado, enmascarado/desenmascarado.

1. Significado de cada estado.

Un servicio activo está en ejecución, si está inactivo no está en ejecución. 
Un servicio habilitado será iniciado al arrancar el sistema, si está deshabilitado no será iniciado al arrancar el sistema.
Un servicio enmascarado no puede ser iniciado mientras permanezca así. Su estado actual cuando fué enmascarado no se ve afecetado por el enmascaramiento.

2. ¿Qué comandos se usan para conocer dichos estados? (cups como ejemplo, nombre del servicio)

activo/inactivo:

    systemctl is-active cups

habilitado/inhabilitado:

    systemctl is-enabled cups

enmascarado/desenmascarado:

    systemctl is-enabled cups

En el caso de enmascarado/desenmascarado te muestra 'masked' si está enmascarado. Si no está enmascarado te muestra el estado correspondiente: habilitado o deshabilitado.

3. Relación entre los estados.

Los cambios en los diferentes estados no modifican los otros, pero sí que afectan a cómo pueden cambiar los demás. Un servicio enmascarado no puede pasar de inactivo a activo. Un servicio deshabilitado no puede activarse en el arranque del sistema, pero si puede activarse por otros medios, siempre que no esté enmascarado.

4. ¿Se puede habilitar y activar un servicio mediante un solo comando? ¿Y desactivarlo y deshabilitarlo?

Sí:

    systemctl enable --now

    systemctl disable --now

# 8. ¿Qué tengo que hacer si quiero...?

1. Parar un proceso que alguien me ha comentado que es un servicio:

Primero comprobar que supone la detención de dicho proceso, mirando sus dependencias etc. Luego detenerlo.

2. Evitar que ese proceso aparezca cada vez que arranco el equipo:

Deshabilitarlo

3. Asegurarme que no se pueda ejecutar de nuevo:

Enmascararlo

# 9. Sobre los niveles de ejecución en GNU/Linux:

1. Definen diferentes configuraciones del sistema. En cada una de ellas se especifica una serie de servicios y  "funcionalidades" que serán arrancadas y otras que no. 

2. Si "mi sistema" es GNU/Linux, lo habitual es que tenga los siguientes niveles: 0, apagado; 1, monousuario (root, sin red, sin entorno gráfico...solución de problemas, emergencia); 2, multiusuario (sin red ni entorno gráfico); 3, multiusuario (con red sin entorno gráfico); 4, similar al 3 pero no se suele usar; 5, multiusuario (con red y entorno gráfico, el habitual); 6, reinicio del sistema.

usuario@ubuntu-20:~$ ls -al /lib/systemd/system/runlevel*
lrwxrwxrwx 1 root root   15 sep  8 09:58 /lib/systemd/system/runlevel0.target -> poweroff.target
lrwxrwxrwx 1 root root   13 sep  8 09:58 /lib/systemd/system/runlevel1.target -> rescue.target
lrwxrwxrwx 1 root root   17 sep  8 09:58 /lib/systemd/system/runlevel2.target -> multi-user.target
lrwxrwxrwx 1 root root   17 sep  8 09:58 /lib/systemd/system/runlevel3.target -> multi-user.target
lrwxrwxrwx 1 root root   17 sep  8 09:58 /lib/systemd/system/runlevel4.target -> multi-user.target
lrwxrwxrwx 1 root root   16 sep  8 09:58 /lib/systemd/system/runlevel5.target -> graphical.target
lrwxrwxrwx 1 root root   13 sep  8 09:58 /lib/systemd/system/runlevel6.target -> reboot.target

3. Runlevel actual: 

usuario@ubuntu-20:~$ who -r
`run-level' 5 2023-03-09 10:31

4. En caso de error como intentaría solucionarlo:

Lanzando el sistema en runlevel1:

    sudo systemctl isolate runlevel1.target

También se puede cambiar el runlevel por defecto:

    sudo systemctl set-default runlevel1.target

5. En caso de requerir conexión a red, el nivel mínimo sería el 3.

6. Puedo apagar y reiniciar el sistema cambiando el runlevel:

Para apagar:

    sudo systemctl isolate runlevel0.target 

Para reiniciar:

    sudo systemctl isolate runlevel6.target

# 10. 

a) ¿Que sistema de inicialización del kernel está utilizando?

usuario@ubuntu-20:~$ ps -p1 | grep "init\|upstart\|systemd"
      1 ?        00:00:03 systemd

b) Tiempo de arranque

usuario@ubuntu-20:~$ systemd-analyze  time
Startup finished in 14.217s (kernel) + 14.042s (userspace) = 28.259s 
graphical.target reached after 14.032s in userspace

Como se puee ver el kernel y el userspace tardan tiempos similares en lanzarse, siendo el graphical.target quien consume prácticamente la totalidad del tiempo que tarda en lanzarse el userspace.

Investigando por la red llego a:

"The graphical.target unit for starting a graphical session, starts system services such as the GNOME Display Manager (gdm.service) or Accounts Service (accounts-daemon.service), and also activates the multi-user.target unit." - Red Hat Customer Portal

Por lo que parece que lo que se está lanzando es el script asociado al runlevel...o eso interpreto yo.

c) Tiempo de carga de cada servicio en la máquina

usuario@ubuntu-20:~$ systemd-analyze blame
26.230s apt-daily.service                                    
10.434s plymouth-quit-wait.service                           
 7.873s vboxadd.service                                      
 2.204s dev-sda5.device                                      
 1.791s apt-daily-upgrade.service                            
 1.554s snapd.service                                        
 1.379s fwupd-refresh.service                                
 1.347s man-db.service                                       
  704ms dev-loop17.device                                    
  702ms dev-loop15.device                                    
  698ms dev-loop16.device                                    
  693ms dev-loop13.device                                    
  662ms dev-loop12.device                                    
  659ms dev-loop9.device                                     
  658ms dev-loop11.device                                    
  651ms dev-loop14.device                                    
  648ms dev-loop10.device                                    
  647ms dev-loop8.device                                     
  530ms networkd-dispatcher.service                          
  481ms dev-loop7.device                                     
  478ms dev-loop5.device                                     
  478ms dev-loop3.device 

