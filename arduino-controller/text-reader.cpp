#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main(){
    string filename = "../my-node-app/output.txt";
    ifstream inputFile(filename);

    if(!inputFile.is_open()){
        cerr << "Error opening file: " << filename << endl;
        return 1;
    }

    string line;

    ofstream outputFile("output.txt");

    if(!outputFile.is_open()){
        cerr << "Error opening file: " << filename << endl;
        return 1;
    }

    while(getline(inputFile, line)){
        outputFile << line << endl;
    }

    inputFile.close();
    outputFile.close();

    return 0;
}