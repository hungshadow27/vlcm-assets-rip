package
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.system.System;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.utils.getTimer;
   
   public class MovieMonitor extends Sprite
   {
      
      public static var aaaaaa:int;
      
      public static var aaaaaa2:int;
      
      private var xml:XML;
      
      private var theText:TextField;
      
      private var fps:int = 0;
      
      private var lastTimeCheck:uint;
      
      private var maxMemory:Number = 0;
      
      private var fpsVector:Vector.<Number> = new Vector.<Number>();
      
      public function MovieMonitor()
      {
         super();
         mouseChildren = false;
         this.xml = <xml>
				<sectionTitle>帧频 监视</sectionTitle>
				<sectionLabel>当前的帧频: </sectionLabel>
				<framesPerSecond>-</framesPerSecond>
				<sectionLabel>一分钟内帧频平均值: </sectionLabel>
				<averageFPS>-</averageFPS>
				<sectionTitle>内存 监视</sectionTitle>
				<sectionLabel>当前使用的内存量: </sectionLabel>
				<directMemory>-</directMemory>
				<sectionLabel>分配的最大内存量: </sectionLabel>
				<directMemoryMax>-</directMemoryMax>
				<sectionTitle>舞台 监视</sectionTitle>
				<sectionLabel>舞台的宽度: </sectionLabel>
				<widthPx>-</widthPx>
				<sectionLabel>舞台的高度: </sectionLabel>
				<heightPx>-</heightPx>
				<sectionLabel>显示对象的个数 : </sectionLabel>
				<nChildren>-</nChildren>
				<shijian>-</shijian>	
				</xml>;
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.setStyle("xml",{
            "fontSize":"10px",
            "fontFamily":"宋体"
         });
         _loc1_.setStyle("sectionTitle",{"color":"#FFAA00"});
         _loc1_.setStyle("sectionLabel",{
            "color":"#CCCCCC",
            "display":"inline"
         });
         _loc1_.setStyle("framesPerSecond",{"color":"#FFFFFF"});
         _loc1_.setStyle("averageFPS",{"color":"#FFFFFF"});
         _loc1_.setStyle("directMemory",{"color":"#FFFFFF"});
         _loc1_.setStyle("directMemoryMax",{"color":"#FFFFFF"});
         _loc1_.setStyle("widthPx",{"color":"#FFFFFF"});
         _loc1_.setStyle("heightPx",{"color":"#FFFFFF"});
         _loc1_.setStyle("nChildren",{"color":"#FFFFFF"});
         _loc1_.setStyle("shijian1",{"color":"#FFFFFF"});
         _loc1_.setStyle("shijian",{"color":"#FFFFFF"});
         _loc1_.setStyle("shijian2",{"color":"#FFFFFF"});
         this.theText = new TextField();
         this.theText.autoSize = TextFieldAutoSize.LEFT;
         this.theText.styleSheet = _loc1_;
         this.theText.condenseWhite = true;
         this.theText.selectable = false;
         this.theText.mouseEnabled = false;
         this.theText.background = true;
         this.theText.backgroundColor = 0;
         addChild(this.theText);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMosDown);
         addEventListener(MouseEvent.MOUSE_UP,this.onMosUp);
      }
      
      public function setAddEv() : void
      {
         addEventListener(Event.ENTER_FRAME,this.update);
      }
      
      public function setRemEv() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.update);
      }
      
      private function update(param1:Event) : void
      {
         var _loc7_:int = 0;
         var _loc2_:int = getTimer();
         var _loc3_:* = int(this.fpsVector.push(this.fps));
         if(_loc3_ > 60)
         {
            this.fpsVector.shift();
            _loc3_--;
         }
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         while(_loc5_ < _loc3_)
         {
            _loc4_ += this.fpsVector[_loc5_];
            _loc5_++;
         }
         _loc4_ /= _loc3_;
         this.xml.averageFPS = Math.round(_loc4_);
         var _loc6_:Number = System.totalMemory;
         this.maxMemory = Math.max(_loc6_,this.maxMemory);
         this.xml.directMemory = (_loc6_ / 1048576).toFixed(3);
         this.xml.directMemoryMax = (this.maxMemory / 1048576).toFixed(3);
         this.xml.shijian = "心跳时间:" + aaaaaa + "-----上一次心跳时间:" + aaaaaa2;
         if(stage != null)
         {
            this.xml.framesPerSecond = this.fps + " / " + stage.frameRate;
            this.xml.widthPx = stage.width + " / " + stage.stageWidth;
            this.xml.heightPx = stage.height + " / " + stage.stageHeight;
            _loc7_ = this.countDisplayList(stage);
            this.xml.nChildren = _loc7_;
         }
         this.fps = 0;
         this.lastTimeCheck = _loc2_;
         this.theText.htmlText = this.xml;
         ++this.fps;
      }
      
      private function countDisplayList(param1:DisplayObjectContainer) : int
      {
         var _loc2_:int = param1.numChildren;
         var _loc3_:* = int(param1.numChildren - 1);
         while(_loc3_ >= 0)
         {
            if(param1.getChildAt(_loc3_) is DisplayObjectContainer)
            {
               _loc2_ += this.countDisplayList(DisplayObjectContainer(param1.getChildAt(_loc3_)));
            }
            _loc3_--;
         }
         return _loc2_;
      }
      
      private function onMosDown(param1:MouseEvent) : void
      {
         this.startDrag();
      }
      
      private function onMosUp(param1:MouseEvent) : void
      {
         this.stopDrag();
      }
   }
}

