#include "Linkedlist.h"
#include <iostream>
#include <regex>
using namespace std;



bool Prog2::add(string str) {
	string check = str.substr(2);
	string name = check.substr(0, check.find(" "));
	for (int i = 0; i < name.length(); i++) {
		name[i] = toupper(name[i]);
	}
	string age = check.substr(check.find(" ") + 1);
	if (find(name)) {
		return false;
	}
	else {
		if (18 <= stoi(age) && stoi(age) <= 40) {
			User *input = new User (name, stoi(age));
			input->next = 0;
			if (first == 0) {
				first = input;
			}
			else
			{
				last->next = input;
			}
			last = input;
			return true;
		}
		else {
			return false;
		}
	}
}
bool Prog2::find(string str) {
	if (first == 0)return 0;

	User *temp = first;

	while (temp != 0) {
		if (temp->name == str)
			return true;
		temp = temp->next;
	}
	return false;

}

bool Prog2::remove(string str) {
	string check = str.substr(2);
	string name = check.substr(0, check.find(" "));
	for (int i = 0; i < name.length(); i++) {
		name[i] = toupper(name[i]);
	}
	if (find(name)) {

		//delete
		User *temp = 0;
		User *prevTemp = 0;

		if (first->name == name) {
			if (first->next != 0) {
				first = first->next;
			}
			else {
				first = last = 0;
			}
			return true;
		}

		temp = first->next;
		prevTemp = first;

		while (temp != 0) {
			if (temp->name == name) {
				prevTemp->next = temp->next;
			}
			prevTemp = temp;
			temp = temp->next;

		}
		return true;
	}
	else {
		return false;
	}
}
void Prog2::listItems() { 

	User *temp = 0;

	if (first == 0) {
		cout << "no transactions" << endl;
	};
	temp = first;
	while (temp != 0) {
		cout << temp->name << " " << temp->age << endl;
		temp = temp->next;
	}
	return;
}

int main(int argc, char* argv[]) {

	string select;
	Prog2 *transactions = new Prog2();

	while (true) {
		cout << "Enter your inputs " << endl;  // Transaction message
		getline(cin, select);

		switch (select[0]) {

		case 'A':
			if (regex_match(select, regex("[A-Z]\\s[a-zA-Z]+\\s[0-9]+"))) {
				if (transactions->add(select)) {
					cout << "name added" << endl;
				}
				else {
					cout << "name not added" << endl;
				}
				break;
			}
			

		case 'D':
			if (regex_match(select, regex("[A-Z]\\s[a-zA-Z]+"))) {
				if (transactions->remove(select)) {
					cout << "name deleted" << endl;
				}
				else {
					cout << "name not found" << endl;
				}
				break;
			}
			
		case 'L':
			if (regex_match(select, regex("[A-Z]"))) {
				transactions->listItems();
				break;
			}

		case 'Q':
			if (regex_match(select, regex("[A-Z]"))) {
				exit(1);
				break;
			}
		default:
			cout << "Wrong instruction format!" << endl;
			break;
		}
	}
}