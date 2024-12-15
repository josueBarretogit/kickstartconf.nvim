> [!NOTE]
> *26.3*	Making a change in many files From usr_26.txt
 
Suppose you have a variable called "x_cnt" and you want to change it to
"x_counter".  This variable is used in several of your C files.  You need to
change it in all files.  This is how you do it.
   Put all the relevant files in the argument list: >

	:args *.c
<
This finds all C files and edits the first one.  Now you can perform a
substitution command on all these files: >

	:argdo %s/\<x_cnt\>/x_counter/ge | update

The ":argdo" command takes an argument that is another command.  That command
will be executed on all files in the argument list.
   The "%s" substitute command that follows works on all lines.  It finds the
word "x_cnt" with "\<x_cnt\>".  The "\<" and "\>" are used to match the whole
word only, and not "px_cnt" or "x_cnt2".
   The flags for the substitute command include "g" to replace all occurrences
of "x_cnt" in the same line.  The "e" flag is used to avoid an error message
when "x_cnt" does not appear in the file.  Otherwise ":argdo" would abort on
the first file where "x_cnt" was not found.
   The "|" separates two commands.  The following "update" command writes the
file only if it was changed.  If no "x_cnt" was changed to "x_counter" nothing
happens.
