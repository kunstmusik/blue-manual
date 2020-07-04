Breaks in Backwards Compatibility
=================================

This section logs any breaks in backwards compatibility.

+---------+-----------------------------------------------------------+
| Version | Description                                               |
+=========+===========================================================+
| 0.124.3 | Previously, if a BSBObject was set to have \"Automation   |
|         | Allowed\" but was not itself automated, it would compile  |
|         | as a constant in the generated CSD. As of 0.124.3, if a   |
|         | widget is made to allow automation, the Csound code that  |
|         | uses the widget value must accept a k-rate signal,        |
|         | whether the API is used or not.                           |
|         |                                                           |
|         | If you have a project that rendered fine before 0.124.3   |
|         | but afterwards can not render due to problems with Csound |
|         | complaining that \"k-rate signals not allowed\", then you |
|         | will need to either set the problematic widgets to not    |
|         | allow automation or change the Csound code so that it     |
|         | will work with the generated k-rate signal.               |
+---------+-----------------------------------------------------------+

: Compatibility Breaks
