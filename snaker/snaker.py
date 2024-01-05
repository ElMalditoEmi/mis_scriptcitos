import sys

argc = len(sys.argv)

if argc > 1:
    for i in range(1,argc):
        line = sys.argv[i]
        sys.stdout.write(line.replace(" ", "_"))
        sys.stdout.write("\n")

else:
    for line in sys.stdin:
        sys.stdout.write(line.replace(" ", "_"))
        sys.stdout.write("\n")

