import std.stdio;

struct SliceView(T)
{
	T* ptr;
	ulong size;

	this(T[] src)
	{
		ptr = src.ptr;
		size = src.length;
	}
}

SliceView!T makeView(T)(T[] slice)
{
	return SliceView!T(slice);
}

struct Point
{
	float x;
	float y;
}

class Something
{
	int number = 12;
}

void main()
{
	auto array = [1, 2, 3];
	writeln(typeid(int[]));
	auto slice = makeView(array);

	auto text = "Edit source/app.d to start your project.";
	debug immutable textSlice = makeView(text);

	Point[] points = [{1, 2}, {3, 4},];
	auto pointSlice = makeView(points);

	auto autoSomething = new Something();
	Something something = new Something();

	writeln(text);
	writeln(string.stringof);
	writeln(typeid(SliceView!int));
}
