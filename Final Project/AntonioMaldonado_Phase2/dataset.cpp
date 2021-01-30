#include <stdio.h>
#include <iostream>
#include <iomanip>
#include <fstream>

using namespace std;

int main() {
	ofstream theFile("players100k.txt");
	for (int i =0; i < 200000; i++){
		theFile << "Tony," << i << ",broncos,mb,21,6900,420000\n";
	}
}