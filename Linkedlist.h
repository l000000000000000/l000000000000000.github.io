
#pragma once
#include <stdio.h>
#include <string>
using namespace std;

struct User {
	string name;
	int age;
	User *next;
	User(string nam, int a) { name = nam; age = a; next = 0; }

};

class Prog2 {


private:
	User *first, *last;

public:

	bool add(string str);
	bool remove(string str);
	bool find(string str);
	void listItems();

};