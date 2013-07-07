////////////////////////////////////////////////////////////////////////////////

//   Author:    Andy Rushton
//   Copyright: (c) Southampton University 1999-2004
//              (c) Andy Rushton           2004 onwards
//   License:   BSD License, see ../docs/license.html

////////////////////////////////////////////////////////////////////////////////
#include "persistent_int.hpp"

namespace stlplus
{

  ////////////////////////////////////////////////////////////////////////////////
  // STL strings

  template<typename charT, typename traits, typename allocator, typename D>
  void dump_basic_string(dump_context& context, const std::basic_string<charT,traits,allocator>& data, D dump_fn)
    throw(persistent_dump_failed)
  {
    unsigned size = data.size();
    dump_unsigned(context, size);
    for (unsigned i = 0; i < size; i++)
    {
      charT ch = data[i];
      dump_fn(context,ch);
    }
  }

  template<typename charT, typename traits, typename allocator, typename R>
  void restore_basic_string(restore_context& context, std::basic_string<charT,traits,allocator>& data, R restore_fn)
    throw(persistent_restore_failed)
  {
    data.erase();
    unsigned size = 0;
    restore_unsigned(context, size);
    for (unsigned i = 0; i < size; i++)
    {
      charT ch;
      restore_fn(context,ch);
      data += ch;
    }
  }

  ////////////////////////////////////////////////////////////////////////////////

} // end namespace stlplus
