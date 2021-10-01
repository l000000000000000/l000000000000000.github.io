#include <iostream>
#include <ctime>
#include "date.h"


using namespace std;

void displayMenu();
void sampleFunction(char);
void daysPassed(int);
void makeDates(Date&,Date&);

int main()
{
	char choice;      // Menu selection
	system("cls");  // Clear Screen
					  //Use system("cls") with Windows OS
	cout << "\n\n\n\n\n\n\n";
	Date date = Date(0,0,0);
	Date cmp1 = Date(0, 0, 0);
	Date cmp2 = Date(0, 0, 0);
	

	do
	{
		// Display the menu and get a valid selection.
		displayMenu();
		cin >> choice;
		while (toupper(choice) < 'A' || toupper(choice) > 'L')
		{
			cout << "Please make a choice in the range of A through L:";
			cin >> choice;
		}
		// Process the user's menu selection.
		switch (choice)
		{
		case 'a':
		case 'A': 
			system("cls");
			int d, m, y;
			cout << "\n\n";			
			cout << "Enter month: \n";
			cin >> m;
			while (m<1 || m > 12)
			{
				cout << "Please select a month in the range of 1 through 12:\n";
				cin >> m;
			}
			
			cout << "Enter day: \n";
			cin >> d;
			if (m != 2) {
				while (d < 1 || d > 31)
				{
					cout << "Please select a day in the range of 1 through 31:\n";
					cin >> d;
				}
			}
			else {
				while (d < 1 || d > 29)
				{
					cout << "Please select a day in the range of 1 through 29:\n";
					cin >> d;
				}
			}
			cout << "Enter year: \n";
			cin >> y;
			if (y % 4 != 0 && d==29) {
				cout << y << " is not a leap year,your selected date will be March 1st!\n";
				
			}
			date.setDay(d);
			date.setMonth(m);
			date.setYear(y);
			
					
			break;
		case 'b':
		case 'B': system("cls");
			cout << "\n\n";
			cout << date;   //overloaded << operator
			cout << "\n\n";
			sampleFunction(choice);
			break;
		case 'c':
		case 'C': 
			system("cls");
			cout << "\n\n";
			date.displayDate(); //function to show weekday,month day and year
			cout << "\n\n";
			sampleFunction(choice);
			break;
		case 'd':
		case 'D': 
			system("cls");
			int addDays;
			cout << "\n\n";
			cout << "Enter days to add: ";
			cin >> addDays;
			date.displayDate(addDays);
			sampleFunction(choice);
			break;
		case 'e':
		case 'E':
			system("cls");
			int delDays;
			cout << "\n\n";
			cout << "Enter days to remove: ";
			cin >> delDays;
			date.displayDate(-delDays);
			sampleFunction(choice);
			break;
		case 'f':
		case 'F':
			system("cls");
			
			cout << "\n\n";			
			daysPassed(0);
			sampleFunction(choice);
			break;
		case 'g':
		case 'G':
			system("cls");
			cout << "\n\n";
			daysPassed(1);
			sampleFunction(choice);
			break;
		case 'h':
		case 'H':
			system("cls");
			cout << "\n\n";
			makeDates(cmp1,cmp2);
			int x;
			x = cmp1 > cmp2;
			if (x == 1) {
				cout << cmp1 << " > " << cmp2;
			}
			else if (x == 0) {
				cout << cmp1 << " = " << cmp2;
			}
			else {
				cout << cmp2 << " > " << cmp1;
			}
			cout << "\n\n";
			sampleFunction(choice);
			break;
		case 'i':
		case 'I':
			system("cls");
			cout << "\n\n";
			date.incDecDate(1);
			cout << "\n\n";
			sampleFunction(choice);
			break;
		case 'j':
		case 'J':
			system("cls");
			cout << "\n\n";
			date.incDecDate(-1);
			cout << "\n\n";
			sampleFunction(choice);
			break;
		case 'k':
		case 'K':
			system("cls");
			cout << "\n\n";
			date.drawCalendar();
			cout << "\n\n";
			sampleFunction(choice);
			break;
		}
	} while (toupper(choice) != 'L');
	cout << "Goodbye!\n";
	return 0;
}

void displayMenu()
{
	cout << "----------------------------------------\n";
	cout << "             CALENDAR MENU\n";
	cout << "----------------------------------------\n";
	cout << "A) Set Date\n";
	cout << "B) Display Date (mm/dd/yyyy)\n";
	cout << "C) Display Date (Weekday,Month day,Year)\n";
	cout << "D) Display future date\n";
	cout << "E) Display past date\n";
	cout << "F) Number of days passed in current year\n";
	cout << "G) Number of days left in current year\n";
	cout << "H) Compare dates\n";
	cout << "I) Increment current date\n";
	cout << "J) Decrement current date\n";
	cout << "K) Display monthly calendar\n";
	cout << "L) Exit the calendar\n";
	cout << "Enter your choice: ";
}

void sampleFunction(char c)
{
	cout << "Your selected option " << c;
	cout << "\n\n\n\n\n";
}

void daysPassed(int n) {
	time_t now;
	struct tm newyear;
	double seconds;
	int days;

	time(&now);  /* get current time; same as: now = time(NULL)  */

	newyear = *localtime(&now);
	

	newyear.tm_hour = 0; newyear.tm_min = 0; newyear.tm_sec = 0;
	newyear.tm_mon = 0;  newyear.tm_mday = 1;

	seconds = difftime(now, mktime(&newyear));
	days = (int)(seconds / (24 * 3600));

	if (n == 0) {
		cout << days << " days passed in current year\n";
	}
	else {
		int yr = 365;
		if (newyear.tm_year % 4 == 0)
			yr = 366;
		cout << yr-days << " days left in current year\n";

	}

}

void makeDates(Date &cmp1,Date &cmp2) {

	int d1, m1, y1,d2,m2,y2;
	cout << "\n\n";
	
	cout << "Date 1 --> Enter month: \n";
	cin >> m1;
	while (m1<1 || m1 > 12)
	{
		cout << "Please select a month in the range of 1 through 12:\n";
		cin >> m1;
	}

	cout << "Date 1 --> Enter day: \n";
	cin >> d1;
	if (m1 != 2) {
		while (d1 < 1 || d1 > 31)
		{
			cout << "Please select a day in the range of 1 through 31:\n";
			cin >> d1;
		}
	}
	else {
		while (d1 < 1 || d1 > 29)
		{
			cout << "Please select a day in the range of 1 through 29:\n";
			cin >> d1;
		}
	}
	
	
	cout << "Date 1 --> Enter year: \n";
	cin >> y1;
	if (y1 % 4 != 0 && d1 == 29) {
		cout << y1 << " is not a leap year,your selected date will be March 1st!\n";

	}
	
	cout << "Date 2 --> Enter month: \n";
	cin >> m2;
	while (m2<1 || m2 > 12)
	{
		cout << "Please select a month in the range of 1 through 12:\n";
		cin >> m2;
	}

	cout << "Date 1 --> Enter day: \n";
	cin >> d2;
	if (m2 != 2) {
		while (d2 < 1 || d2 > 31)
		{
			cout << "Please select a day in the range of 1 through 31:\n";
			cin >> d2;
		}
	}
	else {
		while (d2 < 1 || d2 > 29)
		{
			cout << "Please select a day in the range of 1 through 29:\n";
			cin >> d2;
		}
	}
	cout << "Date 2 --> Enter year: \n";
	cin >> y2;
	if (y2 % 4 != 0 && d2 == 29) {
		cout << y2 << " is not a leap year,your selected date will be March 1st!\n";

	}
	cmp1.setDay(d1);
	cmp1.setMonth(m1);
	cmp1.setYear(y1);
	cmp2.setDay(d2);
	cmp2.setMonth(m2);
	cmp2.setYear(y2);

}

