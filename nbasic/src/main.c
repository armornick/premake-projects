#include "macros.h"

extern WORKER_FUNCTION(program);

int main (int argc, char *argv[]) {
	
	// locate input file
	char* filename;
	if (argc > 1) 
		filename = argv[1];
	else
		filename = "test.bas";

	// read input file
	FILE *inputf = fopen(filename, "r");
	
	// Create our parser
    struct parser_t *parser = parser_new();

    // Setup our input
    //struct input_t *input = input_new(data, strlen(data));
	struct input_t *input = input_from_file_new(inputf);

    // Parse our input
    struct ast_t *ast = parse(parser, input);
	
	WORKER_FNAME(program) (ast);
	
	// clean up
    ast_recursive_delete(ast);
    input_delete(input);
    parser_delete(parser);
    fclose(inputf);
	
	return 0;
}
