#include <iostream>
#include "file_system.hpp"

int main (int argc, char *argv[]) {
	
	std::string testfile = "test.txt";
	if (argc > 1) {
		testfile = argv[1];
	}
	
	bool exists = stlplus::file_exists(testfile);
	if (!exists) {
		std::cout << testfile << " does not exist." << std::endl;
		return 0;
	}
	
	std::cout << std::boolalpha;
	
	std::cout << "readable? " << stlplus::file_readable(testfile) << std::endl;
	std::cout << "writable? " << stlplus::file_writable(testfile) << std::endl;
	if (stlplus::is_folder(testfile)) {
		std::cout << testfile << " is a folder" << std::endl;
	} else {
		std::cout << "file size:  " << stlplus::file_size(testfile) << std::endl;
	}
	
	
	return 0;
}