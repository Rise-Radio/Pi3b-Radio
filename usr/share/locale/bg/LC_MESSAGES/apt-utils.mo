��    :      �  O   �      �  )   �     #  "   ?     b     �     �     �     �     �       1   #     U  ,   d  m   �  #   �  (   #     L     P     i     �  %   �     �  '   �     	       #   *  "   N     q     �     �     �     �     �  #   �  "   	  "   @	  "   c	     �	  "   �	     �	  5   �	  !   

     ,
     @
     W
     i
     �
  "   �
     �
  '  �
  &     V  '  H  ~     �     �     �  #     �  %  ;   �  (     /   F  ;   v     �  2   �  .   �  O   $  .   t  /   �  k   �  9   ?  n   y  �   �  D   �  N   �     J  8   N  G   �  G   �  {     7   �  V   �  @   "  2   c  @   �  K   �  A   #  B   e  6   �  J   �  C   *  =   n  S   �  E       E   F   E   �   /   �   U   !  H   X!  d   �!  [   "  6   b"  @   �"  2   �"  I   #  *   W#  D   �#  ,   �#  @  �#  �
  5&     1  i  &3     �5  G   �5  2   �5  D   6     -   %                        *              6       9   
                   4              2   0               &   1         +             !          #   8       :         $   (   ,   5              .            "       7       3   '                 )   /                      	         %s has no binary override entry either
   %s has no override entry
   %s has no source override entry
   %s maintainer is %s not %s
  DeLink %s [%s]
  DeLink limit of %sB hit.
 %s %s for %s compiled on %s %s
 *** Failed to link %s to %s Archive had no package field Archive has no control record Cannot get debconf version. Is debconf installed? Compress child Compressed output %s needs a compression set DB format is invalid. If you upgraded from an older version of apt, please remove and re-create the database. DB is old, attempting to upgrade %s DB was corrupted, file renamed to %s.old E:  E: Errors apply to file  Error processing contents %s Error processing directory %s Error writing header to contents file Failed to create FILE* Failed to create IPC pipe to subprocess Failed to fork Failed to open %s Failed to read the override file %s Failed to read while computing MD5 Failed to readlink %s Failed to rename %s to %s Failed to resolve %s Failed to stat %s Failed to unlink %s IO to subprocess/file failed Internal error, failed to create %s Malformed override %s line %llu #1 Malformed override %s line %llu #2 Malformed override %s line %llu #3 No selections matched Package extension list is too long Problem unlinking %s Some files are missing in the package file group `%s' Source extension list is too long Tree walking failed Unable to get a cursor Unable to open %s Unable to open DB file %s: %s Unable to write to %s Unknown compression algorithm '%s' Unknown package record! Usage: apt-extracttemplates file1 [file2 ...]

apt-extracttemplates is a tool to extract config and template info
from debian packages

Options:
  -h   This help text
  -t   Set the temp dir
  -c=? Read this configuration file
  -o=? Set an arbitrary configuration option, eg -o dir::cache=/tmp
 Usage: apt-ftparchive [options] command
Commands: packages binarypath [overridefile [pathprefix]]
          sources srcpath [overridefile [pathprefix]]
          contents path
          release path
          generate config [groups]
          clean config

apt-ftparchive generates index files for Debian archives. It supports
many styles of generation from fully automated to functional replacements
for dpkg-scanpackages and dpkg-scansources

apt-ftparchive generates Package files from a tree of .debs. The
Package file contains the contents of all the control fields from
each package as well as the MD5 hash and filesize. An override file
is supported to force the value of Priority and Section.

Similarly apt-ftparchive generates Sources files from a tree of .dscs.
The --source-override option can be used to specify a src override file

The 'packages' and 'sources' command should be run in the root of the
tree. BinaryPath should point to the base of the recursive search and 
override file should contain the override flags. Pathprefix is
appended to the filename fields if present. Example usage from the 
Debian archive:
   apt-ftparchive packages dists/potato/main/binary-i386/ > \
               dists/potato/main/binary-i386/Packages

Options:
  -h    This help text
  --md5 Control MD5 generation
  -s=?  Source override file
  -q    Quiet
  -d=?  Select the optional caching database
  --no-delink Enable delinking debug mode
  --contents  Control contents file generation
  -c=?  Read this configuration file
  -o=?  Set an arbitrary configuration option Usage: apt-internal-solver

apt-internal-solver is an interface to use the current internal
like an external resolver for the APT family for debugging or alike

Options:
  -h  This help text.
  -q  Loggable output - no progress indicator
  -c=? Read this configuration file
  -o=? Set an arbitrary configuration option, eg -o dir::cache=/tmp
 Usage: apt-sortpkgs [options] file1 [file2 ...]

apt-sortpkgs is a simple tool to sort package files. The -s option is used
to indicate what kind of file it is.

Options:
  -h   This help text
  -s   Use source file sorting
  -c=? Read this configuration file
  -o=? Set an arbitrary configuration option, eg -o dir::cache=/tmp
 W:  W: Unable to read directory %s
 W: Unable to stat %s
 realloc - Failed to allocate memory Project-Id-Version: apt 0.7.21
Report-Msgid-Bugs-To: APT Development Team <deity@lists.debian.org>
POT-Creation-Date: 2016-12-08 15:31+0100
PO-Revision-Date: 2012-06-25 17:23+0300
Last-Translator: Damyan Ivanov <dmn@debian.org>
Language-Team: Bulgarian <dict@fsa-bg.org>
Language: bg
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1)
X-Generator: KBabel 1.11.4
   %s няма също и запис „binary override“
   %s няма запис „override“
   %s няма запис „source override“
   поддържащия пакета %s е %s, а не %s
 DeLink %s [%s]
 Превишен лимит на DeLink от %sB.
 %s %s за %s компилиран на %s %s
 *** Неуспех при създаването на връзка %s към %s Архивът няма поле „package“ В архива няма поле „control“ Не може да се извлече версията на debconf. Debconf инсталиран ли е? Процес-потомък за компресиране Компресираният изход %s изисква настройка за компресирането Невалиден формат на БД.  Ако сте обновили от по-стара версия на apt, премахнете базата от данни и я създайте наново. БД е стара, опит за актуализиране на %s БД е повредена, файлът е преименуван на %s.old E:  E: Грешките се отнасят за файла  Грешка при обработката на съдържание %s Грешка при обработката на директория %s Грешка при запазването на заглавната част във файла със съдържание Неуспех при създаването на FILE* Неуспех при създаването на IPC pipe към подпроцеса Неуспех при пускането на подпроцес Неуспех при отварянето на %s Неуспех при четенето на override файл %s Неуспех при четене докато се изчислява MD5 Неуспех при прочитането на връзка %s Неуспех при преименуването на %s на %s Неуспех при превръщането на %s Грешка при получаването на атрибути за %s Неуспех при премахването на връзка %s В/И към подпроцеса/файла пропадна Вътрешна грешка, неуспех при създаването на %s Неправилно форматиран override %s, ред %llu #1 Неправилно форматиран override %s, ред %llu #2 Неправилно форматиран override %s, ред %llu #3 Няма съвпадения на избора Списъкът с разширения на пакети и твърде дълъг Неуспех при премахването на връзка на %s Липсват някои файлове от групата с файлови пакети „%s“ Списъкът с разширения на източници е твърде дълъг Неуспех при обхода на дървото Неуспех при получаването на курсор Неуспех при отварянето на %s Неуспех при отварянето на файл %s от БД: %s Неуспех при записа на %s Непознат алгоритъм за компресия „%s“ Непознат запис за пакет! Употреба: apt-extracttemplates файл1 [файл2 ...]

apt-extracttemplates е инструмент за извличане на конфигурационна информация
и шаблони от дебиански пакети

Опции:
  -h   Този помощен текст.
  -t   Настройване на временна директория
  -c=? Четене на този конфигурационен файл.
  -o=? Настройване на произволна конфигурационна опция, т.е. -o dir::cache=/tmp
 Употреба: apt-ftparchive [опции] команда
Команди:  packages binarypath [overridefile [pathprefix]]
          sources srcpath [overridefile [pathprefix]]
          contents път
          release път
          generate config [групи]
          clean config

apt-ftparchive генерира индексни файлове за архиви на Дебиан. Поддържа
много стилове на генериране от напълно автоматично до функционални
замени на dpkg-scanpackages и dpkg-scansources.

apt-ftparchive генерира „Package“ файлове от дърво с .deb файлове. Файлът
„Package“ представлява съдържанието на всички контролни полета на всеки
пакет, както и MD5 хеш и размер на файла. Стойностите на полетата 
„Priority“ и „Section“ могат да бъдат изменени с файл „override“.

По подобен начин apt-ftparchive генерира „Sources“ файлове от дърво с .dsc 
файлове. Опцията --source-override може да се използва за указване на файл
„override“ за пакети с изходен код.

Командите „packages“ и „sources“ трябва да се изпълняват в корена на дървото.
BinaryPath трябва да сочи към основата, където започва рекурсивното търсене и
файла „override“ трябва да съдържа всички флагове за преназначаване. Pathprefix
се прибавя към полетата на файловите имена, ако съществува. Пример за употреба
от архива на Дебиан:
   apt-ftparchive packages dists/potato/main/binary-i386/ > \
               dists/potato/main/binary-i386/Packages

Опции:
  -h    Този помощен текст.
  --md5 Управление на генерирането на MD5.
  -s=?  Файл „override“ за пакети с изходен код.
  -q    Без показване на съобщения.
  -d=?  Избор на допълнителна база от данни за кеширане.
  --no-delink Включване на режим за премахване на връзки.
  --contents  Управление на генерирането на файлове със съдържание.
  -c=?  Четене на този конфигурационен файл.
  -o=?  Настройване на произволна конфигурационна опция Употреба: apt-internal-solver

apt-internal-solver е интерфейс към вградения в APT механизъм за удовлетворяване на зависимости

Опции:
  -h  Този помощен текст
  -q  Изход, подходящ за журнал — без индикатор на напредъка
  -c=? Указване на файл с настройки
  -o=? Указване на произволна настройка, напр. -o dir::cache=/tmp
 Употреба: apt-sortpkgs [опции] файл1 [файл2 ...]

apt-sortpkgs е опростен инструмент за сортиране на пакетни файлове. Опцията
„-s“ се използва, за да покаже типа на файла.

Опции:
  -h   Този помощен текст.
  -s   Използване на сортиране по изходен код.
  -c=? Четене на този конфигурационен файл.
  -o=? Настройване на произволна конфигурационна опция, т.е. -o dir::cache=/tmp
 W:  W: Неуспех при четенето на директория %s
 W: Неуспех при четенето на %s
 realloc - Неуспех при заделянето на памет 