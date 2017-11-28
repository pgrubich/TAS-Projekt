import tkinter as tk
from calendar import *


class Application(tk.Frame):

    def __init__(self, master):
        tk.Frame.__init__(self, master)
        self.grid()

        year = int(input('\nRok\n'))
        month = int(input('\nMiesiac\n'))
        self.create_widgets(year, month)

    def create_widgets(self, year, month):

        days = ['Pn', 'Wt', 'Sr', 'Czw', 'Pt', 'Sob', 'Nie']
        for i in range(7):
            label = tk.Label(self, text=days[i])
            label.grid(row = 0, column = i)

        weekday, numDays = monthrange(year, month)
        week = 1
        for i in range(1, numDays + 1):
            button = tk.Button(self, text = str(i), height = 5, width = 5, activebackground = 'yellow',
                               command = self.new_window)
            button.grid(row = week, column = weekday)

            weekday += 1
            if weekday > 6:
                week += 1
                weekday = 0
    def new_window(self):
        window = tk.Toplevel()


root = tk.Tk()
root.title('kalendarz')
obj = Application(root)
root.mainloop()
