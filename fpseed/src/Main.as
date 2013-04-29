package
{
  import net.flashpunk.Engine;
  import net.flashpunk.FP;

  public class Main extends Engine
  {
    private const SCREEN_WIDTH:Number = 320;
    private const SCREEN_HEIGHT:Number = 320;
    private const SCREEN_SCALE:Number = 2;
    public function Main()
    {
      super(SCREEN_WIDTH, SCREEN_HEIGHT, 60, false);
      FP.screen.scaleX = SCREEN_SCALE;
      FP.screen.scaleY = SCREEN_SCALE;
      // set initial world here
    }
  }
} 
