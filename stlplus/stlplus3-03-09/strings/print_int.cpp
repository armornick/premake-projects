////////////////////////////////////////////////////////////////////////////////

//   Author:    Andy Rushton
//   Copyright: (c) Southampton University 1999-2004
//              (c) Andy Rushton           2004 onwards
//   License:   BSD License, see ../docs/license.html

////////////////////////////////////////////////////////////////////////////////
#include "print_int.hpp"
#include "string_int.hpp"

namespace stlplus
{

  ////////////////////////////////////////////////////////////////////////////////

  void print_short(std::ostream& device, short i, unsigned radix, radix_display_t display, unsigned width)
    throw(std::invalid_argument)
  {
    device << short_to_string(i, radix, display, width);
  }

  void print_unsigned_short(std::ostream& device, unsigned short i, unsigned radix, radix_display_t display, unsigned width)
    throw(std::invalid_argument)
  {
    device << unsigned_short_to_string(i, radix, display, width);
  }

  void print_int(std::ostream& device, int i, unsigned radix, radix_display_t display, unsigned width)
    throw(std::invalid_argument)
  {
    device << int_to_string(i, radix, display, width);
  }

  void print_unsigned(std::ostream& device, unsigned i, unsigned radix, radix_display_t display, unsigned width)
    throw(std::invalid_argument)
  {
    device << unsigned_to_string(i, radix, display, width);
  }

  void print_long(std::ostream& device, long i, unsigned radix, radix_display_t display, unsigned width)
    throw(std::invalid_argument)
  {
    device << long_to_string(i, radix, display, width);
  }

  void print_unsigned_long(std::ostream& device, unsigned long i, unsigned radix, radix_display_t display, unsigned width)
    throw(std::invalid_argument)
  {
    device << unsigned_long_to_string(i, radix, display, width);
  }

  ////////////////////////////////////////////////////////////////////////////////

} // end namespace stlplus
