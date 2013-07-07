
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

  template<typename T, typename D>
  void dump_vector(dump_context& context, const std::vector<T>& data, D dump_fn)
    throw(persistent_dump_failed)
  {
    dump_unsigned(context,data.size());
    for (unsigned i = 0; i < data.size(); i++)
      dump_fn(context,data[i]);
  }

  template<typename T, typename R>
  void restore_vector(restore_context& context, std::vector<T>& data, R restore_fn)
    throw(persistent_restore_failed)
  {
    unsigned size = 0;
    restore_unsigned(context,size);
    data.resize(size);
    for (unsigned i = 0; i < size; i++)
      restore_fn(context,data[i]);
  }

  ////////////////////////////////////////////////////////////////////////////////

} // end namespace stlplus
