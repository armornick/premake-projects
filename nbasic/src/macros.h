#ifndef _MACROS_H_
#define _MACROS_H_

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <string.h>

#include "parser.h"

#define ast_type(AST) AST->data.tree->type
#define ast_assert_type(AST, TYPE) assert(ast_type(AST) == TYPE)
#define ast_get_children(AST) (AST->data.tree->children)
#define ast_get_num_children(AST) (ast_get_children(AST)->size)
#define ast_get_child(AST, INDEX) ((struct ast_t*) vector_get(ast_get_children(AST), INDEX))
#define ast_type_tostring(AST) (type_strings[ast_type(AST)])

#define WORKER_FNAME(TYPE) parser_work_##TYPE
#define WORKER_FUNCTION(TYPE) void WORKER_FNAME(TYPE) (struct ast_t *ast)


#endif // _MACROS_H_
