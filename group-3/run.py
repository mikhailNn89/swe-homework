import subprocess


		
"""
Что должен указывать преподаватель при создании теста:
- репозиторий
- список файлов которые нужно передать
- список фуункций, которые нужно передать
- файлы теста те, что будут тестировать

"""

target_dir="python"
class FileManager:
	def __init__(self):
		pass
	def check_repro(self):#проверяет репозиторий на наличие обновлений
		pass
	def download_files(self):#качает файлы
		p = subprocess.Popen("cd "+target_dir+" & git apply 1.patch", shell = True)
		#скачиваем патч файл, перемещаем в целевую папку
		#и применяем его cd %целевая папка% & git apply 1.patch
		pass
	
	def check_files(self):#проверяет, все ли файлы присутствуют из указанных преподом
		pass
	def compile(self):
		p = subprocess.Popen("g++ main.c", shell = True)
#file_and_functions={"py1.py":}
		
class TestJava:
	def __init___():
		pass
		
class TestC:
	def test(self,directory):
		p = subprocess.Popen("g++ "+directory+"\/main.c & a.exe", shell = True)
		
		result=""
		"""
		if result=="OK":
			return "OK"
		else:
			return "ERR"
		"""
		return p
		
class TestPy:
	def test(self,directory):
		p = subprocess.Popen("python "+directory+"\/main.py ", shell = True)
		
		result=""
		"""
		if result=="OK":
			return "OK"
		else:
			return "ERR"
		"""
		return p
		
class Mainmanager:
	tester=0
	def __init__(self):
		pass
	def load_tests(self):
		pass
	def set_tester(self,new_tester):
		self.tester=new_tester
	def do_test(self,directory):
		p=self.tester.test(directory)#что тут передавать
		print(p)
		
mng=Mainmanager()
mng.set_tester(TestC())
mng.do_test("downloadedfiles\/repro1")
print("==================")
mng.set_tester(TestPy())
mng.do_test("downloadedfiles\/repo2")

		
if "filename"=="correct_filename":
	pass
class Database:
	def __init__(self):
		pass
	def get_all_tasks(self):
		pass


#p = subprocess.Popen("dir", shell = True)
#print(p)#программа вернет строку, ее надо очистить от лишнего и сравнить эталоном
"""
вытаскиваем из базы правильный вариант ответа из базы
в базе хранится:
- ссылка на репозиторий с заданием
- имя файла
- ммя функции
- то, что функция должна возвращать
"""


