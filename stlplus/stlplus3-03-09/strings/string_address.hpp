#ifndef STLPLUS_STRING_ADDRESS
#define STLPLUS_STRING_ADDRESS
////////////////////////////////////////////////////////////////////////////////

//   Author:    Andy Rushton
//   Copyright: (c) Southampton University 1999-2004
//              (c) Andy Rushton           2004 onwards
//   License:   BSD License, see ../docs/license.html

//   Functions for converting addresses to/from strings

////////////////////////////////////////////////////////////////////////////////
#include "strings_fixes.hpp"
#include "format_types.hpp"
#include <string>
#include <stdexcept>

namespace stlplus
{

  ////////////////////////////////////////////////////////////////////////////////

  std::string address_to_string(const void*,
                                unsigned radix = 16,
                                radix_display_t display = radix_c_style_or_hash,
                                unsigned width = 0)
    throw(std::invalid_argument);

  ////////////////////////////////////////////////////////////////////////////////

  void* string_to_address(const std::string& value,
                          unsigned radix = 0)
    throw(std::invalid_argument);

  ////////////////////////////////////////////////////////////////////////////////

} // end namespace stlplus

#endif
