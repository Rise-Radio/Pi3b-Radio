��    4      �  G   \      x     y     �     �     �     �     �       1   :     l  ,   {  m   �  #     (   :     c     g     �     �  %   �     �  '   �           /  #   A  "   e     �     �     �     �     �     �  #        4  "   J     m  5   �  !   �     �     �     	     	     5	  "   K	     n	  '  �	  &  �
  V  �  H  ,     u     y     �  #   �    �  B   �     $  3   4  1   h  F   �  )   �  1     \   =  C   �  w   �  �   V  =     U   X     �  :   �  i   �  5   X  v   �  *     O   0  8   �  '   �  Z   �  J   <  G   �  9   �  )   	  8   3  C   l  K   �  J   �  "   G  l   j  '   �  J   �  �   J  :   �  0      '   J   9   r   )   �   ;   �   4   !  �  G!    =#  �  D/  ;  2     D4  C   I4  >   �4  <   �4     &   ,                 !       )   %   4   2                      -   1   "                                                              0             .   *      '          	   /   3                                 +       
                 $   #   (      %s maintainer is %s not %s
  DeLink %s [%s]
  DeLink limit of %sB hit.
 %s %s for %s compiled on %s %s
 *** Failed to link %s to %s Archive had no package field Archive has no control record Cannot get debconf version. Is debconf installed? Compress child Compressed output %s needs a compression set DB format is invalid. If you upgraded from an older version of apt, please remove and re-create the database. DB is old, attempting to upgrade %s DB was corrupted, file renamed to %s.old E:  E: Errors apply to file  Error processing contents %s Error processing directory %s Error writing header to contents file Failed to create FILE* Failed to create IPC pipe to subprocess Failed to fork Failed to open %s Failed to read the override file %s Failed to read while computing MD5 Failed to readlink %s Failed to rename %s to %s Failed to resolve %s Failed to stat %s Failed to unlink %s IO to subprocess/file failed Internal error, failed to create %s No selections matched Package extension list is too long Problem unlinking %s Some files are missing in the package file group `%s' Source extension list is too long Tree walking failed Unable to get a cursor Unable to open %s Unable to open DB file %s: %s Unable to write to %s Unknown compression algorithm '%s' Unknown package record! Usage: apt-extracttemplates file1 [file2 ...]

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
 realloc - Failed to allocate memory Project-Id-Version: apt-all
Report-Msgid-Bugs-To: APT Development Team <deity@lists.debian.org>
POT-Creation-Date: 2016-12-08 15:31+0100
PO-Revision-Date: 2012-09-25 20:19+0300
Last-Translator: A. Bondarenko <artem.brz@gmail.com>
Language-Team: Українська <uk@li.org>
Language: uk
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: KBabel 1.11.1
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
   пакунок %s супроводжується %s, а не %s
 DeLink %s [%s]
  Перевищено ліміт в %sB в DeLink.
 %s %s для %s скомпільовано %s %s
 *** Не вдалося створити посилання %s на %s Архів не мав поля 'package' В архіві немає запису 'control' Неможливо визначити версію debconf. Він встановлений? Процес-нащадок, що виконує пакування Для отримання стиснутого виводу %s необхідно ввімкнути стиснення Невірний формат БД. Якщо ви оновилися зі старої версії apt, будь-ласка видаліть і наново створіть базу-даних. БД застаріла, намагаюсь оновити %s БД була пошкоджена, файл перейменований на %s.old П:  П: Помилки відносяться до файлу  Помилка обробки повного переліку вмісту пакунків (Contents) %s Помилка обробки директорії %s Помилка запису заголовка в повний перелік вмісту пакунків (Contents) Не вдалося створити FILE* Не вдалося створити IPC канал для підпроцесу Не вдалося породити процес (fork) Не вдалося відкрити %s Не вдалося прочитати файл перепризначень (override) %s Помилка зчитування під час обчислення MD5 Не вдалося прочитати посилання (readlink) %s Не вдалося перейменувати %s на %s Не вдалося визначити %s Не вдалося одержати атрибути %s Не вдалося видалити посилання (unlink) %s Помилка уведення/виводу в підпроцес/файл Внутрішня помилка, не вдалося створити %s Збігів не виявлено Список розширень, припустимих для пакунків, занадто довгий Не вдалося видалити %s У групі пакунків '%s' відсутні деякі файли Список розширень, припустимих для пакунків з вихідними текстами, занадто довгий Не вдалося зробити обхід дерева Неможливо одержати курсор Не вдалося відкрити %s Не вдалося відкрити файл БД %s: %s Неможливо записати в %s Невідомий алгоритм стиснення '%s' Невідомий запис про пакунок! Використання: apt-extracttemplates file1 [file2 ...]

apt-extracttemplates витягує з пакунків Debian конфігураційні скрипти
і файли-шаблони

Опції:
  -h   Цей текст
  -t   Встановити директорію для тимчасових файлів
  -c=? Читати зазначений конфігураційний файл
  -o=? Вказати довільну опцію, наприклад, -o dir::cache=/tmp
 Використання: apt-ftparchive [параметри] команда
Команди:  packages binarypath [overridefile [pathprefix]]
          sources srcpath [overridefile [pathprefix]]
          contents path
          release path
          generate config [groups]
          clean config

apt-ftparchive генерує індексні файли архівів Debian. Він підтримує
безліч стилів генерації: від повністю автоматичного до функціональної заміни
програм dpkg-scanpackages і dpkg-scansources

apt-ftparchive генерує файли Package (переліки пакунків) для дерева
тек, що містять файли .deb. Файл Package містить у собі керуючі
поля кожного пакунка, а також хеш MD5 і розмір файлу. Значення керуючих
полів "пріоритет" (Priority) і "секція" (Section) можуть бути змінені з
допомогою файлу override.

Крім того, apt-ftparchive може генерувати файли Sources з дерева
тек, що містять файли .dsc. Для вказівки файлу override у цьому 
режимі можна використати параметр --source-override.

Команди 'packages' і 'sources' треба виконувати, перебуваючи в кореневій теці
дерева, що ви хочете обробити. BinaryPath повинен вказувати на місце,
з якого починається рекурсивний обхід, а файл перепризначень (override)
повинен містити запис про перепризначення керуючих полів. Якщо був зазначений
Pathprefix, то його значення додається до керуючих полів, що містять
імена файлів. Приклад використання для архіву Debian:
   apt-ftparchive packages dists/potato/main/binary-i386/ > \
               dists/potato/main/binary-i386/Packages

Параметри:
  -h    Цей текст
  --md5 Керування генерацією MD5-хешів
  -s=?  Вказати файл перепризначень (override) для пакунків з вихідними текстами
  -q    Не виводити повідомлення в процесі роботи
  -d=?  Вказати кешуючу базу даних (не обов'язково)
  --no-delink Включити режим налагодження процесу видалення файлів
  --contents  Керування генерацією повного переліку вмісту пакунків
              (файлу Contents)
  -c=?  Використати зазначений конфігураційний файл
  -o=?  Вказати довільний параметр конфігурації Використання: apt-internal-solver

apt-internal-solver це інтерфейс для використання поточного
внутрішнього розв'язувача (як зовнішнього) для АРТ програм
для дебагу чи інших цілей

Опції:
  -h     Цей текст допомоги.
  -q     Виводити повідомлення, придатні для запису у файл журналу.
          Не виводити індикатор прогресу
  -c=? Читати зазначений конфігураційний файл
  -o=? Вказати умовну опцію, наприклад, -o dir::cache=/tmp
 Використання: apt-sortpkgs [options] file1 [file2 ...]

apt-sortpkgs - простий інструмент для сортування переліків пакунків. Опція -s
використається, щоб вказати тип списку.

Опції:
  -h   цей текст
  -s   сортувати список файлів з вихідними текстами
  -c=? читати зазначений файл конфігурації
  -o=? встановити довільну опцію, наприклад, -o dir::cache=/tmp
 У:  У: Не вдалося прочитати директорію %s
 У: Неможливо прочитати атрибути %s
 realloc - Не вдалося виділити пам'ять 