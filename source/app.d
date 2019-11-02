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

struct Point
{
	float x;
	float y;
}

SliceView!T makeView(T)(T[] slice)
{
	return SliceView!T(slice);
}

void main()
{
	auto array = [1, 2, 3];
	auto slice = makeView(array);

	auto text = "Edit source/app.d to start your project.";
	auto textSlice = makeView(text);

	Point[] points = [
		{1, 2},
		{3, 4},
	];
	auto pointSlice = makeView(points);

	writeln(text);
	writeln(string.stringof);
}
