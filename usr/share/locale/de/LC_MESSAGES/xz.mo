��   �   0   p  �   �     �     �  �      ,  �   -  7  �  �  7  -      F   .     u     �  7   �  �   �  �   Z  �   N  �  �  H   �     �  E   c  �   �    F  >   V  9   �  �   �  �   e  �   �  �   l  �   :  �   �  l   �     �          -     G     e     �     �     �     �  z   �     h     �     �  .   �  6   �           '      ;   !   Q   !   s   '   �      �      �      �   *   !  /   G!  %   w!     �!  /   �!  ,   �!     "  4   ""     W"     s"     �"     �"     �"      �"       #  h   !#  <   �#     �#  :   �#  $   $     :$  2   U$     �$  $   �$  /   �$  I   �$     D%  3   X%  =   �%  d   �%      /&  O   P&  .   �&  /   �&     �&  A   '  )   \'     �'     �'  8   �'     �'     �'  (   (  I   :(  !   �(  '   �(  '   �(  9   �(     0)     K)  0   N)     )  <   �)  -   �)  @   �)  /   0*  7   `*  D   �*  &   �*  '   +     ,+  %   4+     Z+     r+  
   �+  
   �+  
   �+  
   �+  
   �+  	   �+  	   �+  	   �+  	   �+  	   �+  	   �+  	   �+  "   �+  *    ,     K,  A   _,  Q   �,  *   �,  @   -  !   _-     �-  x  �-    �.  \  0  �  b4  :   b6  O   �6     �6     	7  g   7  =   �7    �7  �   �8    �9  l   �;  �   <  F   �<  �   �<  H  �=  B   ?  >   \?  �   �?  �   s@  �   "A  4  �A  	  C  �   D  q   �D     PE     lE     �E     �E      �E     �E      F     F     :F  �   VF     �F     �F     G  -   #G  >   QG     �G     �G     �G  &   �G  +   �G  (   (H  '   QH  (   yH  (   �H  /   �H  >   �H  .   :I     iI  J   |I  1   �I     �I  ;   J     KJ     gJ     ~J      �J     �J  %   �J  '   �J  ^    K  S   K     �K  H   �K  .   /L     ^L  /   ~L     �L  -   �L  ,   �L  Y   %M     M  2   �M  H   �M  y   N      �N  m   �N  <   O  D   WO     �O  F   �O  ,   P     0P     <P  G   ZP     �P     �P  4   �P  U   Q     ^Q  ,   {Q  ,   �Q  I   �Q     R     7R  C   <R     �R  K   �R  �   �R  B   RS  2   �S  4   �S  V   �S  .   TT  +   �T     �T  2   �T     �T     U     U      U     )U     2U     ;U     DU     LU     TU     \U     dU     lU     tU  ,   |U     �U     �U  Z   �U  T   <V  @   �V  E   �V  0   W     IW     \   ;           G       z   �           �          �   /              S   s      *          ]             3   6       o       "   b       7   ^   '       1   a       
   [       ,   Y   �   w   _          H   !   |   �   h            X       $           q      .                          v          #   c       ?          C      i           +   {       P       M   @   �       (   =       >   D       �       J   r   d   E             �       :                  y   l   j   <   T   O   0      W   Z       k   K   &           I          B   m      p   9      n      V   u   t   5   x       	      L         �   g   2           `   )   F   U       4   e   }   ~          R   %       f               N   -   8              A   Q         LW     SW  �  �  �    ZW  2          �����W  0               �����W  [          ����X  '               ���� 
  --delta[=OPTS]      Delta filter; valid OPTS (valid values; default):
                        dist=NUM   distance between bytes being subtracted
                                   from each other (1-256; 1) 
  --lzma1[=OPTS]      LZMA1 or LZMA2; OPTS is a comma-separated list of zero or
  --lzma2[=OPTS]      more of the following options (valid values; default):
                        preset=PRE reset options to a preset (0-9[e])
                        dict=NUM   dictionary size (4KiB - 1536MiB; 8MiB)
                        lc=NUM     number of literal context bits (0-4; 3)
                        lp=NUM     number of literal position bits (0-4; 0)
                        pb=NUM     number of position bits (0-4; 2)
                        mode=MODE  compression mode (fast, normal; normal)
                        nice=NUM   nice length of a match (2-273; 64)
                        mf=NAME    match finder (hc3, hc4, bt2, bt3, bt4; bt4)
                        depth=NUM  maximum search depth; 0=automatic (default) 
  --x86[=OPTS]        x86 BCJ filter (32-bit and 64-bit)
  --powerpc[=OPTS]    PowerPC BCJ filter (big endian only)
  --ia64[=OPTS]       IA-64 (Itanium) BCJ filter
  --arm[=OPTS]        ARM BCJ filter (little endian only)
  --armthumb[=OPTS]   ARM-Thumb BCJ filter (little endian only)
  --sparc[=OPTS]      SPARC BCJ filter
                      Valid OPTS for all BCJ filters:
                        start=NUM  start offset for conversions (default=0) 
 Basic file format and compression options:
 
 Custom filter chain for compression (alternative for using presets): 
 Operation modifiers:
 
 Other options:
 
With no FILE, or when FILE is -, read standard input.
       --info-memory   display the total amount of RAM and the currently active
                      memory usage limits, and exit       --memlimit-compress=LIMIT
      --memlimit-decompress=LIMIT
  -M, --memlimit=LIMIT
                      set memory usage limit for compression, decompression,
                      or both; LIMIT is in bytes, % of RAM, or 0 for defaults       --no-adjust     if compression settings exceed the memory usage limit,
                      give an error instead of adjusting the settings downwards       --no-sparse     do not create sparse files when decompressing
  -S, --suffix=.SUF   use the suffix `.SUF' on compressed files
      --files[=FILE]  read filenames to process from FILE; if FILE is
                      omitted, filenames are read from the standard input;
                      filenames must be terminated with the newline character
      --files0[=FILE] like --files but use the null character as terminator       --robot         use machine-parsable messages (useful for scripts)       --single-stream decompress only the first stream, and silently
                      ignore possible remaining input data       CheckVal %*s Header  Flags        CompSize    MemUsage  Filters   -0 ... -9           compression preset; default is 6; take compressor *and*
                      decompressor memory usage into account before using 7-9!   -F, --format=FMT    file format to encode or decode; possible values are
                      `auto' (default), `xz', `lzma', and `raw'
  -C, --check=CHECK   integrity check type: `none' (use with caution),
                      `crc32', `crc64' (default), or `sha256'   -Q, --no-warn       make warnings not affect the exit status   -V, --version       display the version number and exit   -e, --extreme       try to improve compression ratio by using more CPU time;
                      does not affect decompressor memory requirements   -h, --help          display the short help (lists only the basic options)
  -H, --long-help     display this long help and exit   -h, --help          display this short help and exit
  -H, --long-help     display the long help (lists also the advanced options)   -k, --keep          keep (don't delete) input files
  -f, --force         force overwrite of output file and (de)compress links
  -c, --stdout        write to standard output and don't delete input files   -q, --quiet         suppress warnings; specify twice to suppress errors too
  -v, --verbose       be verbose; specify twice for even more verbose   -z, --compress      force compression
  -d, --decompress    force decompression
  -t, --test          test compressed file integrity
  -l, --list          list information about .xz files   Blocks:
    Stream     Block      CompOffset    UncompOffset       TotalSize      UncompSize  Ratio  Check   Blocks:             %s
   Check:              %s
   Compressed size:    %s
   Memory needed:      %s MiB
   Minimum XZ Utils version: %s
   Number of files:    %s
   Ratio:              %s
   Sizes in headers:   %s
   Stream padding:     %s
   Streams:
    Stream    Blocks      CompOffset    UncompOffset        CompSize      UncompSize  Ratio  Check      Padding   Streams:            %s
   Uncompressed size:  %s
  Operation mode:
 %s MiB of memory is required. The limit is %s. %s MiB of memory is required. The limiter is disabled. %s file
 %s files
 %s home page: <%s>
 %s: Cannot remove: %s %s: Cannot set the file group: %s %s: Cannot set the file owner: %s %s: Cannot set the file permissions: %s %s: Closing the file failed: %s %s: Error reading filenames: %s %s: Error seeking the file: %s %s: File already has `%s' suffix, skipping %s: File has setuid or setgid bit set, skipping %s: File has sticky bit set, skipping %s: File is empty %s: File seems to have been moved, not removing %s: Filename has an unknown suffix, skipping %s: Filter chain: %s
 %s: Input file has more than one hard link, skipping %s: Invalid filename suffix %s: Invalid multiplier suffix %s: Invalid option name %s: Invalid option value %s: Is a directory, skipping %s: Is a symbolic link, skipping %s: Not a regular file, skipping %s: Null character found when reading filenames; maybe you meant to use `--files0' instead of `--files'? %s: Options must be `name=value' pairs separated with commas %s: Read error: %s %s: Seeking failed when trying to create a sparse file: %s %s: Too small to be a valid .xz file %s: Unexpected end of file %s: Unexpected end of input when reading filenames %s: Unknown file format type %s: Unsupported integrity check type %s: Value is not a non-negative decimal integer %s: With --format=raw, --suffix=.SUF is required unless writing to stdout %s: Write error: %s --list does not support reading from standard input --list works only on .xz files (--format=xz or --format=auto) Adjusted LZMA%c dictionary size from %s MiB to %s MiB to not exceed the memory usage limit of %s MiB Cannot establish signal handlers Cannot read data from standard input when reading filenames from standard input Compressed data cannot be read from a terminal Compressed data cannot be written to a terminal Compressed data is corrupt Compression and decompression with --robot are not supported yet. Decompression will need %s MiB of memory. Disabled Empty filename, skipping Error restoring the O_APPEND flag to standard output: %s File format not recognized Internal error (bug) LZMA1 cannot be used with the .xz format Mandatory arguments to long options are mandatory for short options too.
 Maximum number of filters is four Memory usage limit for compression:     Memory usage limit for decompression:   Memory usage limit is too low for the given filter setup. Memory usage limit reached No No integrity check; not verifying file integrity None Only one file can be specified with `--files' or `--files0'. Report bugs to <%s> (in English or Finnish).
 Strms  Blocks   Compressed Uncompressed  Ratio  Check   Filename The .lzma format supports only the LZMA1 filter The environment variable %s contains too many arguments The exact options of the presets may vary between software versions. The sum of lc and lp must not exceed 4 Total amount of physical memory (RAM):  Totals: Try `%s --help' for more information. Unexpected end of input Unknown error Unknown-11 Unknown-12 Unknown-13 Unknown-14 Unknown-15 Unknown-2 Unknown-3 Unknown-5 Unknown-6 Unknown-7 Unknown-8 Unknown-9 Unsupported LZMA1/LZMA2 preset: %s Unsupported filter chain or filter options Unsupported options Unsupported type of integrity check; not verifying file integrity Usage: %s [OPTION]... [FILE]...
Compress or decompress FILEs in the .xz format.

 Using a preset in raw mode is discouraged. Valid suffixes are `KiB' (2^10), `MiB' (2^20), and `GiB' (2^30). Writing to standard output failed Yes Project-Id-Version: XZ Utils 4.999.9beta
Report-Msgid-Bugs-To: lasse.collin@tukaani.org
POT-Creation-Date: 2012-11-29 03:17+0000
PO-Revision-Date: 2010-09-07 20:27+0200
Last-Translator:  <maan@systemlinux.org>
Language-Team: German
Language: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 
  --delta[=OPTIONEN]    Delta Filter; zulässige Optionen (gültige Werte;
                        Voreinstellung):
                          dist=NUM  Abstand zwischen den Bytes, die voneinander
                                    subtrahiert werden (1-256; 1) 
  --lzma1[=OPTIONEN]    LZMA1 oder LZMA2; OPTIONEN ist eine durch Kommata
  --lzma2[=OPTIONEN]    getrennte Liste bestehend aus den folgenden Optionen
                        (zulässige Werte; Voreinstellung):
                          preset=NUM Setze Optionen zurück zu Voreinstellung
                                     (0-9[e])
                          dict=NUM   Wörterbuch Größe (4 KiB - 1536 MiB; 8 MiB)
                          lc=NUM     Anzahl der Literal Kontext Bits (0-4; 3)
                          lp=NUM     Anzahl der Literal Positionsbits (0-4; 0)
                          pb=NUM     Anzahl der Positionsbits (0-4; 2)
                          mode=MODUS Kompressionsmodus (fast, normal; normal)
                          nice=NUM   Nice-Länge eines Treffers (2-273; 64)
                          mf=NAME    Algorithmus zum Auffinden von
                                     Übereinstimmungen (hc3, hc4, bt2, bt3, bt4;
                                     bt4)
                          depth=NUM  Maximale Suchtiefe; 0=automatisch
                                     (Voreinstellung) 
  --x86[=OPTIONEN]      x86 BCJ Filter (32-bit und 64-bit)
  --powerpc[=OPTIONEN]  PowerPC BCJ Filter (nur big endian)
  --ia64[=OPTIONEN]     IA64 (Itanium) BCJ Filter
  --arm[=OPTIONEN]      ARM BCJ Filter (nur little endian)
  --armthumb[=OPTIONEN] ARM-Thumb BCJ Filter (nur little endian)
  --sparc[=OPTIONEN]    SPARC BCJ Filter
                        Zulässige Optionen für alle BCJ Filter:
                          start=NUM  Start-Offset für Konversion
                          (Voreinstellung=0) 
 Grundlegende Optionen für Dateiformat und Kompression:
 
 User-definierte Filter Kette für Kompression (alternativ zu Voreinstellung): 
 Operationsmodifikatoren:
 
 Andere Optionen:
 
Wenn DATEI nicht angegeben wurde, oder DATEI gleich - ist, dann wird von
der Standardeingabe gelesen.
       --info-memory     zeige Speicherlimit an und terminiere       --memlimit-compress=LIMIT
      --memlimit-decompress=LIMIT
  -M, --memlimit=LIMIT  Setze Speicher Nutzungslimit für Kompression,
                        Dekompression, oder beides; LIMIT ist in bytes, % RAM,
                        oder 0 für Grundeinstellungen.       --no-adjust       Wenn die Kompressionseinstellungen das Speicher
                        Nutzungslimit übersteigen, erzeuge einen Fehler statt
                        die Einstellungen nach unten anzupassen.       --no-sparse       erzeuge keine sparse Datei beim Dekomprimieren
  -S, --suffix=.SUF     benutze `.SUF' Endung für komprimierte Dateien
      --files=[DATEI]   lese zu verarbeitende Dateinamen von DATEI; falls
                        DATEI nicht angegeben wurde, werden Dateinamen
                        von Standard Input gelesen. Dateinamen müssen mit
                        einem Zeilenumbruch voneinander getrennt werden
      --files0=[DATEI]  wie --files, aber benutze den Null Charakter als Trenner       --robot           benutze Maschinen-lesbare Meldungen (nützlich für
                        Skripte)       --single-stream dekomprimiere nur den ersten Datenstrom und ignoriere
                      stillschweigend mögliche weitere Eingabedaten       CheckWert %*s  Kopf  Schalter    KompGröße    Speicher  Filter   -0 .. -9              Kompressionseinstellung; Voreinstellung is 6. Beachten
                        Sie den Speicherverbrauch des Komprimieres *und* des
                        Dekomprimierers, wenn Sie 7-9 benutzen!   -F, --format=FMT      Dateiformat zur Kodierung oder Dekodierung; mögliche
                        Werte sind `auto' (Voreinstellung), `xz', `lzma' und
                        `raw'
  -C, --check=CHECK     Typ des Integritätschecks: `none' (Vorsicht), `crc32',
                        `crc64' (Voreinstellung), oder `sha256'   -Q, --no-warn         Warnungen verändern nicht den exit status   -V, --version         zeige Versionsnummer an und terminiere   -e, --extreme         Versuche durch stärkere CPU Nutzung das Kompressions-
                        verhältnis zu verbessern. Das beeinflusst nicht den
                        Speicherbedarf des Dekomprimierers.   -h, --help            zeige kurze Hilfe and (zeigt nur die grundlegenden
                        Optionen)
  -H, --long-help       zeige diese lange Hilfe an und terminiere   -h, --help            zeige diese kurze Hilfe an und terminiere
  -H, --long-help       zeige die lange Hilfe an (zeigt auch fortgeschrittene
                        Optionen an)   -k, --keep            Eingabedateien beibehalten (nicht löschen)
  -f, --force           erzwinge Überschreiben der Ausgabedatei und
                        (de)komprimiere Verweise (Links)
  -c, --stdout          schreibe nach Standard Output und lösche nicht die
                        Eingabedateien   -q, --quiet           unterdrücke Warnungen; benutze diese Option zweimal
                        um auch Fehlermeldungen zu unterdrücken
  -v, --verbose         sei gesprächig; benutze diese Option zweimal um noch
                        gesprächiger zu sein   -z, --compress        erzwinge Komprimierung
  -d, --decompress      erzwinge Dekomprimierung
  -t, --test            überprüfe Datei Integrität
  -l, --list            liste Datei Informationen   Blöcke:
     Strom     Block      KompOffset    UnkompOffset      TotalGröße     UnkompGröße  Verh.  Check   Blöcke:              %s
   Check:               %s
   Größe komprimiert:   %s
   Benötigter Speicher: %s MiB
   Kleinste XZ Utils version: %s
    Anzahl Dateien:     %s
   Verhältnis:          %s
   Größe in Köpfen:     %s
   Strom Auffüllung:    %s
   Ströme:
     Strom    Blöcke      KompOffset    UnkompOffset       KompGröße     UnkompGröße  Verh.  Check   Auffüllung   Ströme:              %s
   Größe unkomprimiert: %s
  Operationsmodus:
 %s MiB Speicher wird benötigt. Limit ist %s. %s MiB Speicher wird benötigt. Der Begrenzer ist deaktiviert. %s Datei
 %s Dateien
 %s Homepage: <%s>
 %s: Kann nicht löschen: %s %s: Kann Datei Gruppe nicht setzen: %s %s: Kann Datei Eigentümer nicht setzen: %s %s: Kann Zugriffsrechte nicht setzen: %s %s: Fehler beim Schießen der Datei: %s %s: Fehler beim Lesen der Dateinamen: %s %s: Fehler beim Lesen der Dateinamen: %s %s: Datei hat bereits `%s' Endung, überspringe %s: Datei hat das setuid oder setgid Bit gesetzt, überspringe %s: Datei hat sticky Bit gesetzt, überspringe %s: Datei ist leer %s: Datei scheint umbenannt worden zu sein, daher wird sie nicht gelöscht %s: Dateiname hat unbekannte Endung, überspringe %s: Filter Kette: %s
 %s: Eingabedatei hat mehr als einen hard link, überspringe %s: Ungültige Datei Endung %s: Ungültige Einheit %s: Ungültige Option %s: Ungültiger Wert für Option %s: Überspringe Verzeichnis %s: Überspringe symbolischen Verweis %s: Keine reguläre Datei, überspringe %s: Null Charakter gefunden beim Lesen der Dateinamen; Meinten Sie `--files0' statt `--files'? %s: Optionen müssen in der Form `Name=Wert` gegeben werden, getrennt durch Kommata %s: Lesefehler: %s %s: Positionierungsfehler beim Versuch eine sparse Datei zu erzeugen: %s %s: Zu klein um ein gültiges .xz file zu sein %s: Unerwartetes Ende der Datei %s: Unerwartetes Ende beim Lesen der Dateinamen %s: Unbekanntes file format %s: Integritäts-Check Typ nicht unterstützt %s: Wert ist keine nicht-negative ganze Zahl %s: Mit --format=raw ist --sufix=.SUF notwendig, falls nicht nach stdout geschrieben wird %s: Schreibfehler: %s --list unterstützt kein Lesen der Standardeingabe --list funktioniert nur mit .xz Dateien (--format=xz oder --format=auto) Passte LZMA%c Wörterbuch Größe von %s MiB to %s MiB an, um nicht das Speicher Nutzungslimit von %s MiB zu übersteigen Kann Signal Routine nicht setzen Lesen der Standardeingabe ist nicht möglich, wenn die Dateinamen auch von der Standardeingabe gelesen werden Komprimierte Daten können nicht vom Terminal gelesen werden Komprimierte Daten können nicht auf das Terminal geschrieben werden Komprimierte Daten sind korrupt Kompression und Dekompression mit --robot ist noch nicht unterstützt. Dekompression wird %s MiB Speicher brauchen. Deaktiviert Leere Dateiname, überspringe Fehler beim Wiederherstellen des O_APPEND flags bei Standard Output: %s Datei Format nicht erkannt Interner Fehler (Bug) LZMA1 kann nicht mit dem .xz Format verwendet werden Obligatorische Argumente für lange Optionen sind auch für kurze Optionen
zwingend.
 Maximal vier Filter möglich Speicher Nutzungslimit für Kompression:     Speicher Nutzungslimit für Dekompression:   Das Speicher Limit ist zu niedrig für die gegebene Filter Konfiguration. Speicher-Limit erreicht Nein Kein Integritäts-Check; werde Datei-Integrität nicht überprüfen Kein Nur ein file kann als Argument für --files oder --files0 angegeben werden. Melde Bugs an <%s> (in englisch oder finnisch).
Melde Übersetzungsfehler an <maan@systemlinux.org> (in englisch oder deutsch).
  Str.  Blöcke       Kompr.     Unkompr.  Verh.  Check   Dateiname Das .lzma Format unterstützt nur den LZMA1 Filter Die Umgebungsvariable %s enthält zu viele Argumente Die genauen Optionen der Voreinstellung können zwischen Software Versionen variieren. Die Summe aus lc und lp darf höchstens 4 sein Gesamtmenge physikalischer Speicher (RAM):  Gesamt: Versuchen Sie `%s --help' für mehr Informationen. Unerwartetes Eingabe Ende Unbekannter Fehler Unbek.11 Unbek.12 Unbek.13 Unbek.14 Unbek.15 Unbek.2 Unbek.3 Unbek.5 Unbek.6 Unbek.7 Unbek.8 Unbek.9 LZMA1/LZMA2 Voreinstellung ist ungültig: %s Optionen nicht unterstützt Optionen nicht unterstützt Typ des Integritäts-Checks nicht unterstützt; werde Datei-Integrität nicht überprüfen Benutzung: %s [OPTION]... [DATEI]...
Komprimiert oder dekomprimiert .xz DATEI(EN).

 Verwendung der Voreinstellung im raw Modus wird nicht empfohlen. Gültige Einheiten sind `KiB' (2^10), `MiB' (2^20), und `GiB' (2^30). Schreiben auf die Standardausgabe fehlgeschlagen Ja PRIu32 PRIu64 The selected match finder requires at least nice=% Value of the option `%s' must be in the range [%, %] Der ausgewählte Algorithmus zum Auffinden von Übereinstimmungen braucht mindestens nice=% Wert der Option `%s' muss im Bereich [%, %] sein 