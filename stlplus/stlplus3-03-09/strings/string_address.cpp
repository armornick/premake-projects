////////////////////////////////////////////////////////////////////////////////

//   Author:    Andy Rushton
//   Copyright: (c) Southampton University 1999-2004
//              (c) Andy Rushton           2004 onwards
//   License:   BSD License, see ../docs/license.html

//   use the unsigned long representation for pointers

////////////////////////////////////////////////////////////////////////////////
#include "string_address.hpp"
#include "string_int.hpp"
////////////////////////////////////////////////////////////////////////////////

namespace stlplus
{

  ////////////////////////////////////////////////////////////////////////////////

  std::string address_to_string(const void* i, unsigned radix, radix_display_t display, unsigned width)
    throw(std::invalid_argument)
  {
    return unsigned_long_to_string((unsigned long)i, radix, display, width);
  }

  ////////////////////////////////////////////////////////////////////////////////

  void* string_to_address(const std::string& str, unsigned radix)
    throw(std::invalid_argument)
  {
    return (void*)string_to_unsigned_long(str, radix);
  }

  ////////////////////////////////////////////////////////////////////////////////

} // end namespace stlplus
