#include "macros.h"

// forward declarations
WORKER_FUNCTION(expression);

WORKER_FUNCTION(factor) {
	ast_assert_type(ast, TYPE_FACTOR);
	struct ast_t *child = ast_get_child(ast, 0);
	char *text;
	switch (ast_type(child)) {
		case TYPE_ID:
		case TYPE_NUM:
			text = ast_children_as_string(child);
			printf("%s", text);
			free(text);
			break;
		default:
			printf("received statement type: %s\n", ast_type_tostring(child));
			break;
	}
}

WORKER_FUNCTION(do) {
	ast_assert_type(ast, TYPE_DOSTAT);
}

WORKER_FUNCTION(assign) {
	ast_assert_type(ast, TYPE_ASSIGNSTAT);
}

WORKER_FUNCTION(while) {
	ast_assert_type(ast, TYPE_WHILESTAT);
}

WORKER_FUNCTION(if) {
	ast_assert_type(ast, TYPE_IFSTAT);
}

WORKER_FUNCTION(print) {
	ast_assert_type(ast, TYPE_PRINTSTAT);
	struct ast_t *child = ast_get_child(ast, 0);
	ast_assert_type(child, TYPE_EXPRLIST);
	size_t num_chil = ast_get_num_children(child);
	printf("print(");
	
	size_t i; char *text;
	for (i = 0; i < num_chil; i++) {
		struct ast_t *expr = ast_get_child(child, i);
		switch (ast_type(expr)) {
			case TYPE_STRING:
				text = ast_children_as_string(expr);
				printf("\"%s\"", text);
				free(text);
				break;
			case TYPE_EXPRESSION:
				break;
		}
		// comma between expressions
		if (i < (num_chil-1)) {
			printf(",");
		}
	}
	printf(")\n");
}

WORKER_FUNCTION(input) {
	ast_assert_type(ast, TYPE_INPUTSTAT);
	struct ast_t *child = ast_get_child(ast, 0);
	char *text;
	if (ast_type(child) != TYPE_ID) {
		text = ast_children_as_string(child);
		printf("io.write(\"%s\")\n", text);
		free(text);
		child = ast_get_child(ast, 1);
	}
	ast_assert_type(child, TYPE_ID);
	text = ast_children_as_string(child);
	printf("%s = io.read()\n", text);
	free(text);
}

WORKER_FUNCTION(end) {
	ast_assert_type(ast, TYPE_ENDSTAT);
	printf("return (");
	size_t num_chil = ast_get_num_children(ast);
	if (num_chil > 0) {
		struct ast_t *child = ast_get_child(ast, 0);
		WORKER_FNAME(factor) (child);
	} else {
		printf("0");
	}
	printf(")");
}

WORKER_FUNCTION(statement) {
	ast_assert_type(ast, TYPE_STATEMENT);
	struct ast_t *child = ast_get_child(ast, 0);
	switch (ast_type(child)) {
		case TYPE_ENDSTAT:
			WORKER_FNAME(end) (child);
			break;
		case TYPE_INPUTSTAT:
			WORKER_FNAME(input) (child);
			break;
		case TYPE_PRINTSTAT:
			WORKER_FNAME(print) (child);
			break;
		case TYPE_IFSTAT:
			WORKER_FNAME(if) (child);
			break;
		case TYPE_WHILESTAT:
			WORKER_FNAME(while) (child);
			break;
		case TYPE_ASSIGNSTAT:
			WORKER_FNAME(assign) (child);
			break;
		case TYPE_DOSTAT:
			WORKER_FNAME(do) (child);
			break;
		default:
			printf("received statement type: %s\n", ast_type_tostring(child));
			break;
	}
}

WORKER_FUNCTION(program) {
	ast_assert_type(ast, TYPE_PROGRAM);
	size_t num_chil = ast_get_num_children(ast);
#ifdef DEBUG
	printf("our program consists of %d statements\n\n", num_chil);
#endif
	
	size_t i;
	for (i = 0; i < num_chil; i++) {
		struct ast_t *child = ast_get_child(ast, i);
		WORKER_FNAME(statement) (child);
	}
}
