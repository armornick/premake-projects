#ifndef STLPLUS_STRING_INT
#define STLPLUS_STRING_INT
////////////////////////////////////////////////////////////////////////////////

//   Author:    Andy Rushton
//   Copyright: (c) Southampton University 1999-2004
//              (c) Andy Rushton           2004 onwards
//   License:   BSD License, see ../docs/license.html

//   Convert integer types to/from string

////////////////////////////////////////////////////////////////////////////////
#include "strings_fixes.hpp"
#include "format_types.hpp"
#include <string>
#include <stdexcept>

namespace stlplus
{

  ////////////////////////////////////////////////////////////////////////////////
  // Conversions of Integer types to string
  ////////////////////////////////////////////////////////////////////////////////

  // The radix (i.e. base) for these conversions can be any value from base 2 to base 36
  // specifying any other radix causes std::invalid_argument to be thrown

  // The way in which the radix is displayed is defined in radix_types.hpp
  // If any other value is used, std::invalid_argument is thrown

  // The width argument specifies the number of numerical digits to use in the result
  // This is a minimum - if the value requires more digits then it will be wider than the width argument
  // However, if it is smaller, then it will be extended to the specified width
  // Then, the radix display prefix is added to this width

  // For example, using the hash representation of 0 in hex with width=4 gives:
  // 16#0000 - so there's 4 digits in the number part

  std::string short_to_string(short i,
                              unsigned radix = 10,
                              radix_display_t display = radix_c_style_or_hash,
                              unsigned width = 0)
    throw(std::invalid_argument);

  std::string unsigned_short_to_string(unsigned short i,
                                       unsigned radix = 10,
                                       radix_display_t display = radix_c_style_or_hash,
                                       unsigned width = 0)
    throw(std::invalid_argument);

  std::string int_to_string(int i,
                            unsigned radix = 10,
                            radix_display_t display = radix_c_style_or_hash,
                            unsigned width = 0)
    throw(std::invalid_argument);

  std::string unsigned_to_string(unsigned i,
                                 unsigned radix = 10,
                                 radix_display_t display = radix_c_style_or_hash,
                                 unsigned width = 0)
    throw(std::invalid_argument);

  std::string long_to_string(long i,
                             unsigned radix = 10,
                             radix_display_t display = radix_c_style_or_hash,
                             unsigned width = 0)
    throw(std::invalid_argument);

  std::string unsigned_long_to_string(unsigned long i,
                                      unsigned radix = 10,
                                      radix_display_t display = radix_c_style_or_hash,
                                      unsigned width = 0)
    throw(std::invalid_argument);

  ////////////////////////////////////////////////////////////////////////////////
  // Convert a string to an integer type
  ////////////////////////////////////////////////////////////////////////////////
  // supports all the formats described above for the reverse conversion
  // If the radix is set to zero, the conversions deduce the radix from the string representation
  // So,
  //   0b prefix is binary,
  //   0 prefix is octal,
  //   0x is hex
  //   <base># prefix is my hash format
  // The radix must be either zero as explained above, or in the range 2 to 16
  // A non-zero radix should be used when the string value has no radix information and is non-decimal
  // e.g. the hex value FEDCBA has no indication that it is hex, so specify radix 16
  // Any other value of radix will cause std::invalid_argument to be thrown

  short string_to_short(const std::string& value,
                        unsigned radix = 0)
    throw(std::invalid_argument);

  unsigned short string_to_unsigned_short(const std::string& value,
                                          unsigned radix = 0)
    throw(std::invalid_argument);

  int string_to_int(const std::string& value,
                    unsigned radix = 0)
    throw(std::invalid_argument);

  unsigned string_to_unsigned(const std::string& value,
                              unsigned radix = 0)
    throw(std::invalid_argument);

  long string_to_long(const std::string& value,
                      unsigned radix = 0)
    throw(std::invalid_argument);

  unsigned long string_to_unsigned_long(const std::string& value,
                                        unsigned radix = 0)
    throw(std::invalid_argument);

  ////////////////////////////////////////////////////////////////////////////////

} // end namespace stlplus

#endif
