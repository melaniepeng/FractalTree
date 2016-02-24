private double fractionLength = 0.8; 
private int smallestBranch = 8; 
private double branchAngle = 0.2;  
double l = 10;
double a = 3*Math.PI/2;
public void setup() 
{   
	size(740,800);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(400,680,400,780);   
	drawBranches(400,680,l,a);

} 
public void keyTyped()
{
	if (key == 's')
	{
		l = l + 10;
		redraw();
	}
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength = branchLength * fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);    
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y); 
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	if (branchLength >= smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength,angle1);
		drawBranches(endX2,endY2,branchLength,angle2);
	}
} 
