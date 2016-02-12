import cx_Freeze

executables = [cx_Freeze.Executable('PygameTut.py')]

cx_Freeze.setup(
    name = "A Bit Racey",
    options = {"build_exe": {"packages":["pygame"],
                             "include_files":["racecar.png","caricon"]}},
    executables = executables

    )
