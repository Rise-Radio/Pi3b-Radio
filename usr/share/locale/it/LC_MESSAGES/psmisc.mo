��    S      �  q   L        Q    `   c
  b   �
  0   '  p   X  k   �  #   5     Y     v     �  )   �  	   �  3   �       �   '      �  ,   �  $        )      >     _       #   �  !   �     �     �  <     <   N  <   �  %   �      �          .     I     `     o     �     �     �  �   �  &   �     �     �     �  �     d   �     N  $   e  u   �  C      =   D     �  &   �     �  )   �     �  �    H   �  (     E  0  �   v  .   2  F   a  "   �  -   �     �  
        $  2   7  $   j  ,   �  '   �  '   �               '     <     P     X     a     h     p  m  w  �  �  n   �"  ^   #  =   j#  t   �#  �   $  $   �$     �$     �$     %  =   %     ]%  @   k%  $   �%  �   �%  3   m&  @   �&  9   �&      '  *   ='  &   h'  &   �'  2   �'  -   �'      (  &   8(  :   _(  :   �(  :   �(  %   )      6)  )   W)      �)     �)     �)     �)     �)      *  "   '*  �   J*  ,   +  #   9+     ]+  "   w+  �   �+     n,     �,  #   
-  {   .-  D   �-  =   �-     -.      F.     g.  6   ~.     �.    �.  J   �2  '   .3  m  V3  �   �4  1   �5  I   �5     6  4   "6  %   W6     }6     �6  7   �6  -   �6  =   
7  )   H7  1   r7     �7     �7     �7     �7     �7  	   �7  	    8     
8     8     0                &       1   5       =       /      ,   7   K   M   @   :      2                    8      G           H           '      Q   6           S   3       E       I                  9   #   %       ;   !   >   D                         .       A   "            O      	      $   R   B      +   C   (      
   *         )           P              -   F       <   N                           ?   L      J   4           killall -l, --list
       killall -V, --version

  -e,--exact          require exact match for very long names
  -I,--ignore-case    case insensitive process name match
  -g,--process-group  kill process group instead of process
  -y,--younger-than   kill processes younger than TIME
  -o,--older-than     kill processes older than TIME
  -i,--interactive    ask for confirmation before killing
  -l,--list           list all known signal names
  -q,--quiet          don't print complaints
  -r,--regexp         interpret NAME as an extended regular expression
  -s,--signal SIGNAL  send this signal instead of SIGTERM
  -u,--user USER      kill only process(es) running as USER
  -v,--verbose        report if the signal was successfully sent
  -V,--version        display version information
  -w,--wait           wait for processes to die
   -                     reset options

  udp/tcp names: [local_port][,[rmt_host][,[rmt_port]]]

   -4,--ipv4             search IPv4 sockets only
  -6,--ipv6             search IPv6 sockets only
   -Z     show         SELinux security contexts
   -Z,--context REGEXP kill only process(es) having context
                      (must precede other arguments)
   PID    start at this PID; default is 1 (init)
  USER   show only trees rooted at processes of this user

 %*s USER        PID ACCESS COMMAND
 %s is empty (not mounted ?)
 %s: Invalid option %s
 %s: no process found
 %s: unknown signal; %s -l lists signals.
 (unknown) /proc is not mounted, cannot stat /proc/self/stat.
 Bad regular expression: %s
 CPU Times
  This Process    (user system guest blkio): %6.2f %6.2f %6.2f %6.2f
  Child processes (user system guest):       %6.2f %6.2f %6.2f
 Can't get terminal capabilities
 Cannot allocate memory for matched proc: %s
 Cannot find socket's device number.
 Cannot find user %s
 Cannot open /proc directory: %s
 Cannot open /proc/net/unix: %s
 Cannot open a network socket.
 Cannot open protocol file "%s": %s
 Cannot resolve local port %s: %s
 Cannot stat %s: %s
 Cannot stat file %s: %s
 Copyright (C) 1993-2009 Werner Almesberger and Craig Small

 Copyright (C) 1993-2010 Werner Almesberger and Craig Small

 Copyright (C) 1993-2012 Werner Almesberger and Craig Small

 Copyright (C) 2007 Trent Waddington

 Copyright (C) 2009 Craig Small

 Could not kill process %d: %s
 Error attaching to pid %i
 Invalid namespace name Invalid option Invalid time format Kill %s(%s%d) ? (y/N)  Kill process %d ? (y/N)  Killed %s(%s%d) with signal %d
 Memory
  Vsize:       %-10s
  RSS:         %-10s 		 RSS Limit: %s
  Code Start:  %#-10lx		 Code Stop:  %#-10lx
  Stack Start: %#-10lx
  Stack Pointer (ESP): %#10lx	 Inst Pointer (EIP): %#10lx
 Namespace option requires an argument. No process specification given No processes found.
 No such user name: %s
 PSmisc comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it under
the terms of the GNU General Public License.
For more information about these matters, see the files named COPYING.
 Page Faults
  This Process    (minor major): %8lu  %8lu
  Child Processes (minor major): %8lu  %8lu
 Press return to close
 Process with pid %d does not exist.
 Process, Group and Session IDs
  Process ID: %d		  Parent ID: %d
    Group ID: %d		 Session ID: %d
  T Group ID: %d

 Process: %-14s		State: %c (%s)
  CPU#:  %-3d		TTY: %s	Threads: %ld
 Scheduling
  Policy: %s
  Nice:   %ld 		 RT Priority: %ld %s
 Signal %s(%s%d) ? (y/N)  Specified filename %s does not exist.
 TERM is not set
 Unable to open stat file for pid %d (%s)
 Unknown local port AF %d
 Usage: fuser [-fMuvw] [-a|-s] [-4|-6] [-c|-m|-n SPACE] [-k [-i] [-SIGNAL]] NAME...
       fuser -l
       fuser -V
Show which processes use the named files, sockets, or filesystems.

  -a,--all              display unused files too
  -i,--interactive      ask before killing (ignored without -k)
  -k,--kill             kill processes accessing the named file
  -l,--list-signals     list available signal names
  -m,--mount            show all processes using the named filesystems or block device
  -M,--ismountpoint     fulfill request only if NAME is a mount point
  -n,--namespace SPACE  search in this name space (file, udp, or tcp)
  -s,--silent           silent operation
  -SIGNAL               send this signal instead of SIGKILL
  -u,--user             display user IDs
  -v,--verbose          verbose output
  -w,--writeonly        kill only processes with write access
  -V,--version          display version information
 Usage: killall [-Z CONTEXT] [-u USER] [ -eIgiqrvw ] [ -SIGNAL ] NAME...
 Usage: killall [OPTION]... [--] NAME...
 Usage: peekfd [-8] [-n] [-c] [-d] [-V] [-h] <pid> [<fd> ..]
    -8 output 8 bit clean streams.
    -n don't display read/write from fd headers.
    -c peek at any new child processes too.
    -d remove duplicate read/writes from the output.
    -V prints version info.
    -h prints this help.

  Press CTRL-C to end output.
 Usage: prtstat [options] PID ...
       prtstat -V
Print information about a process
    -r,--raw       Raw display of information
    -V,--version   Display version information and exit
 You can only use files with mountpoint options You cannot search for only IPv4 and only IPv6 sockets at the same time You must provide at least one PID. all option cannot be used with silent option. asprintf in print_stat failed.
 disk sleep fuser (PSmisc) %s
 killall: %s lacks process entries (not mounted ?)
 killall: Bad regular expression: %s
 killall: Cannot get UID from process status
 killall: Maximum number of names is %d
 killall: skipping partial match %s(%d)
 paging peekfd (PSmisc) %s
 prtstat (PSmisc) %s
 pstree (PSmisc) %s
 running sleeping traced unknown zombie Project-Id-Version: psmisc 22.20rc1
Report-Msgid-Bugs-To: csmall@small.dropbear.id.au
POT-Creation-Date: 2014-02-02 17:04+1100
PO-Revision-Date: 2013-01-17 18:30+0000
Last-Translator: Marco Colombo <m.colombo@ed.ac.uk>
Language-Team: Italian <tp@lists.linux.it>
Language: it
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
      killall -l, --list
     killall -V, --version

  -e,--exact          richiede una corrispondenza esatta per i nomi molto lunghi
  -I,--ignore-case    ignora maiuscole/minuscole nei nomi
  -g,--process-group  termina il gruppo di processi invece del processo
  -y,--younger-than   termina i processi più recenti di ORARIO
  -o,--older-than     termina i processi più vecchi di ORARIO
  -i,--interactive    chiede conferma prima di terminare
  -l,--list           elenca i nomi di segnale conosciuti
  -q,--quiet          opera silenziosamente
  -r,--regexp         interpreta NOME come un'espressione regolare estesa
  -s,--signal SEGNALE invia il segnale indicato invece di SIGTERM
  -u,--user UTENTE    termina solo i processi eseguiti dall'UTENTE
  -v,--verbose        riporta se il segnale è stato inviato con successo
  -V,--version        mostra le informazioni sulla versione
  -w,--wait           aspetta la terminazione del processo

   -                     reimposta le opzioni

  nomi udp/tcp: [porta locale][,[host remoto][,[porta remota]]]
   -4,--ipv4             cerca solo socket IPv4
  -6,--ipv6             cerca solo socket IPv6
   -Z     show         mostra i contesti di sicurezza SELinux
   -Z,--context REGEXP termina solo i processi aventi context
                      (deve precedere altri argomenti)
     PID       comincia dal pid indicato, predefinito 1 (init)
    UTENTE    mostra solo gli alberi con radice nei processi dell'utente

 %*s UTENTE      PID ACCESSO COMANDO
 %s è vuoto (non montato?)
 %s: Opzione %s non valida
 %s: nessun processo trovato
 %s: segnale sconosciuto; usare %s -l per elencare i segnali.
 (sconosciuto) /proc non è montato, impossibile fare stat di /proc/self/stat.
 Espressione regolare non valida: %s
 Utilizzo temporale CPU
  Questo processo (user system guest blkio): %6.2f %6.2f %6.2f %6.2f
  Processi figli  (user system guest):       %6.2f %6.2f %6.2f
 Impossibile determinare le capacità del terminale
 Impossibile allocare memoria per il processo corrispondente: %s
 Impossibile trovare il numero di dispositivo del socket.
 Impossibile trovare l'utente %s
 Impossibile aprire la directory /proc: %s
 Impossibile aprire /proc/net/unix: %s
 Impossibile aprire un socket di rete.
 Impossibile aprire il file di protocollo "%s": %s
 Impossibile risolvere la porta locale %s: %s
 Impossibile fare stat di %s: %s
 Impossibile fare stat del file %s: %s
 Copyright (C) 1993-2009 Werner Almesberger e Craig Small

 Copyright (C) 1993-2010 Werner Almesberger e Craig Small

 Copyright (C) 1993-2012 Werner Almesberger e Craig Small

 Copyright (C) 2007 Trent Waddington

 Copyright (C) 2009 Craig Small

 Impossibile terminare il processo %d: %s
 Errore nel collegarsi al pid %i
 Nome di contesto non valido Opzione non valida Formato orario non valido Terminare %s(%s%d)? (s/N)  Terminare il processo %d? (s/N)  Terminato %s(%s%d) con segnale %d
 Memoria
  Vsize:       %-10s
  RSS:         %-10s 		 RSS Limit: %s
  Code Start:  %#-10lx		 Code Stop:  %#-10lx
  Stack Start: %#-10lx
  Stack Pointer (ESP): %#10lx	 Inst Pointer (EIP): %#10lx
 L'opzione di contesto richiede un argomento. Nessun tipo di processo specificato Nessun processo trovato.
 Questo nome utente non esiste: %s
 PSmisc è distribuito senza ALCUNA GARANZIA.
Questo è software libero, ed è possibile redistribuirlo secondo i termini
della GNU General Public License.
Si consulti il file COPYING per ulteriori informazioni.
 Errori di pagina (page faults)
  Questo processo (minore maggiore): %8lu  %8lu
  Processi figli  (minore maggiore): %8lu  %8lu
 Premere Invio per chiudere
 Il processo con pid %d non esiste.
 ID di processo, gruppo e sessione
  ID Processo: %d		  ID Parent: %d
    ID Gruppo: %d		ID Sessione: %d
  ID Gruppo T: %d

 Processo: %-14s		Stato: %c (%s)
  CPU#:  %-3d		TTY: %s	Threads: %ld
 Scheduling
  Policy: %s
  Nice:   %ld 		 RT Priority: %ld %s
 Segnale %s(%s%d)? (s/N)  Il file indicato %s non esiste.
 TERM non è impostato
 Impossibile aprire il file di stat per il pid %d (%s)
 Porta locale AF %d sconosciuta
 Uso: fuser [-fMuvw] [-a|-s] [-4|-6] [-c|-m|-n CONTESTO] [-k [-i] [-SEGNALE]] NOME...
     fuser -l
     fuser -V
Mostra quali processi stanno usando un certo file, socket o filesystem.

  -a,--all           mostra anche i file inutilizzati
  -i,--interactive   conferma prima di terminare (ignorato senza -k)
  -k,--kill          termina i processi che accedono al file specificato
  -l,--list-signals  elenca i nomi dei segnali disponibili
  -m,--mount         mostra tutti i processi che usano i filesystem o i
                     dispositivi a blocchi specificati
  -M,--ismountpoint  soddisfa la richiesta solo se NOME è un mount point
  -n,--namespace CONTESTO  cerca nel contesto specificato (file, udp, o tcp)
  -s,--silent        opera silenziosamente
  -SEGNALE           invia il segnale indicato invece di SIGKILL
  -u,--user          mostra gli ID utente
  -v,--verbose       output prolisso
  -w, --writeonly    termina solo i processi con accesso alla scrittura
  -V,--verion        mostra le informazioni sulla versione
 Uso: killall [-Z CONTESTO] [-u UTENTE] [ -eIgiqrvw ] [ -SEGNALE ] NOME...
 Uso: killall [OPZIONE]... [--] NOME...
 Uso: peekfd [-8] [-n] [-c] [-d] [-V] [-h] <pid> [<fd> ..]
    -8 emetti output pulito a 8 bit
    -n non mostrare letture/scritture dalle intestazioni del fd
    -c peek anche i processi figli
    -d rimuove dall'output le letture/scritture duplicate
    -V stampa le informazioni sulla versione
    -h stampa questo aiuto

  Premere CTRL-C per terminare l'output.
 Uso: prtstat [opzioni] PID ...
     prtstat -V
Stampa informazioni su un processo
    -r,--raw       Mostra informazioni grezze
    -V,--version   Mostra le informazioni sulla versione ed esce
 Con l'opzione -m si possono specificare solo file Impossibile cercare solo socket IPv4 e solo socket IPv6 allo stesso tempo Occorre indicare almeno un PID. L'opzione -a non può essere usata con l'opzione -s. asprintf in print_stat non riuscito.
 in attesa del disco fuser (PSmisc) %s
 killall: %s non ha una voce di processo (non montato?)
 killall: Espressione regolare non valida: %s
 killall: Impossibile ottenere l'UID dallo stato del processo
 killall: Il massimo numero di nomi è %d
 killall: ignorata corrispondenza parziale %s(%d)
 paging peekfd (PSmisc) %s
 prtstat (PSmisc) %s
 pstree (PSmisc) %s
 in esecuzione in attesa tracciato sconosciuto zombie 