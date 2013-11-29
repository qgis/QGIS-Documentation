__author__ = 'timlinux'

def total(the_list, the_round_flag=False):
    """Compute the total value of all scalars in a list and round if requested.

    Args:
        the_list: list of scalars (int or float).
        the_round_flag: boolean indicating if result should be rounded.

    Returns:
        float

    Raises: TypeError

    .. note:: List elements which are not ints or floats will be silently
       ignored.

    """

    if str(type(the_list)) not in '<type \'list\'>':
        print str(type(the_list))
        raise TypeError('the_list must be a list of numbers')

    my_total = 0
    for my_value in the_list:
        if str(type(my_value)) in ['<type \'int\'>', '<type \'float\'>']:
            my_total += my_value

    if the_round_flag:
        my_total = round(my_total)

    return my_total

