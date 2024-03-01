import os
from tkinter.filedialog import askdirectory

script_dir = os.path.dirname(os.path.realpath(__file__))
os.chdir(script_dir)

folder_path = askdirectory()
ext = ['dll', 'vst3', 'aaxplugin', 'clap']
file = open('mypluglist.txt', 'w')

def getFileName(dir, file_list):
    dir_new = dir
    if os.path.isfile(dir):
        file_list.append(os.path.basename(dir))
    elif os.path.isdir(dir):
        for i in os.listdir(dir):
            dir_new = os.path.join(dir, i)
            getFileName(dir_new, file_list)
    return file_list

if __name__ == '__main__':
    def myPlugList(my_path):
        my_list = getFileName(my_path, [])
        for j in my_list:
            index = j.find('.')
            file_ext = j[index+1:]       
            if file_ext in ext:
                print(j[:index])
                file.write(j[:index] + '\n')

myPlugList(folder_path)
