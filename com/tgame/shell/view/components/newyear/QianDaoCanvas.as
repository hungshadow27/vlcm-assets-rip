package com.tgame.shell.view.components.newyear
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.NewYearPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   
   public class QianDaoCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var choujiangBtn:SimpleButton;
      
      private var duigou:Bitmap;
      
      private var fuSp:Sprite;
      
      private var lingquxunzhangBtn:NewButton;
      
      private var xunzhangSp:Sprite;
      
      private var curSeleteXunzhang:ItemFace;
      
      private var huojiangTxt:FTextArea;
      
      private var duigouArr:Array;
      
      private var maniandajiBG:DisplayObject;
      
      private var xunzhangItemArr:Array;
      
      public function QianDaoCanvas()
      {
         var bg:DisplayObject;
         var bg1:Shape;
         var onClick1:Function;
         var onClick2:Function;
         var img9:F9GridBitmap = null;
         var huojiangmingdan:FTextArea = null;
         var $class:Class = null;
         var i:int = 0;
         var fuBtn:SimpleButton = null;
         this.duigouArr = [];
         this.xunzhangItemArr = [];
         super();
         bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/newyear/bg1.png",532,560);
         bg.x = 10;
         bg.y = 2;
         addChild(bg);
         img9 = Tools.get9GridBitmpByName("huojiangBg");
         addChild(img9);
         img9.width = 200;
         img9.height = 500;
         img9.x = 540;
         img9.y = 60;
         bg1 = new Shape();
         bg1.graphics.beginFill(0,0.2);
         bg1.graphics.drawRect(548,90,184,462);
         graphics.endFill();
         addChild(bg1);
         huojiangmingdan = new FTextArea();
         huojiangmingdan.htmlText = "<font size=\'14\' color=\'" + StaticValue.YELLOW + "\'>" + LanResManager.getLanCommonTextWords("获奖名单") + "</font>";
         huojiangmingdan.textColor = StaticValue.YELLOW;
         huojiangmingdan.x = 540 + 70;
         huojiangmingdan.y = 60 + 7;
         addChild(huojiangmingdan);
         this.huojiangTxt = new FTextArea();
         this.huojiangTxt.width = 175;
         this.huojiangTxt.height = 455;
         this.huojiangTxt.x = 550;
         this.huojiangTxt.y = 95;
         this.huojiangTxt.wordWrap = true;
         this.huojiangTxt.textColor = StaticValue.WHITE;
         addChild(this.huojiangTxt);
         this.maniandajiBG = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/newyear/maniandaji.jpg",444,183);
         this.maniandajiBG.x = 53;
         this.maniandajiBG.y = 243;
         addChild(this.maniandajiBG);
         $class = getDefinitionByName("ui.newyear.qiandao.btn1") as Class;
         this.choujiangBtn = new $class() as SimpleButton;
         this.choujiangBtn.x = 240;
         this.choujiangBtn.y = 365;
         addChild(this.choujiangBtn);
         this.choujiangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fuSp = new Sprite();
         this.fuSp.x = 53;
         this.fuSp.y = 243;
         addChild(this.fuSp);
         i = 0;
         while(i < 5)
         {
            onClick1 = function(param1:MouseEvent):void
            {
               $parent.dispatchEvent(new BaseEvent(NewYearPanel.QIANDAOPANEL_CHOUJIANG_CLICK));
            };
            $class = getDefinitionByName("ui.newyear.qiandao.btn2") as Class;
            fuBtn = new $class() as SimpleButton;
            fuBtn.x = 20 + i * 80;
            fuBtn.y = 5;
            this.fuSp.addChild(fuBtn);
            fuBtn.addEventListener(MouseEvent.CLICK,onClick1);
            i++;
         }
         i = 0;
         while(i < 5)
         {
            onClick2 = function(param1:MouseEvent):void
            {
               $parent.dispatchEvent(new BaseEvent(NewYearPanel.QIANDAOPANEL_CHOUJIANG_CLICK));
            };
            $class = getDefinitionByName("ui.newyear.qiandao.btn2") as Class;
            fuBtn = new $class() as SimpleButton;
            fuBtn.x = 20 + i * 80;
            fuBtn.y = 90;
            this.fuSp.addChild(fuBtn);
            fuBtn.addEventListener(MouseEvent.CLICK,onClick2);
            i++;
         }
         this.fuSp.visible = false;
         this.lingquxunzhangBtn = new NewButton();
         this.lingquxunzhangBtn.x = 222;
         this.lingquxunzhangBtn.y = 516;
         this.lingquxunzhangBtn.textColor = StaticValue.WHITE;
         this.lingquxunzhangBtn.label = LanResManager.getLanCommonTextWords("领取勋章");
         this.lingquxunzhangBtn.setPandding(8,2,18,10);
         this.lingquxunzhangBtn.setSkin("chunlianBtn");
         addChild(this.lingquxunzhangBtn);
         this.lingquxunzhangBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.xunzhangSp = new Sprite();
         addChild(this.xunzhangSp);
         this.xunzhangSp.x = 130;
         this.xunzhangSp.y = 448;
      }
      
      public function updata(param1:Array, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Bitmap = null;
         _loc3_ = 0;
         while(_loc3_ < this.duigouArr.length)
         {
            if(Boolean(this.duigouArr[_loc3_]) && Boolean(this.duigouArr[_loc3_].parent))
            {
               (this.duigouArr[_loc3_] as Bitmap).parent.removeChild(this.duigouArr[_loc3_]);
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_] == 1)
            {
               _loc4_ = StaticValue.getBitmapByClassName("ui.newyear.qiandao.duigou");
               _loc4_.x = 92 + _loc3_ * 49;
               _loc4_.y = 179;
               addChild(_loc4_);
               this.duigouArr.push(_loc4_);
            }
            _loc3_++;
         }
         this.maniandajiBG.visible = true;
         this.fuSp.visible = false;
         this.choujiangBtn.visible = param2;
      }
      
      public function updataXunZhang(param1:Array) : void
      {
         var i:int;
         var itemface:ItemFace = null;
         var obj:DisplayObject = null;
         var arr:Array = param1;
         this.xunzhangItemArr = [];
         while(this.xunzhangSp.numChildren > 0)
         {
            this.xunzhangSp.removeChildAt(0);
         }
         i = 0;
         while(i < arr.length)
         {
            if(arr[i] != -1)
            {
               itemface = new ItemFace(new Goods(arr[i]));
               itemface.x = i * 64;
               itemface.name = arr[i];
               this.xunzhangSp.addChild(itemface);
               itemface.addEventListener(MouseEvent.CLICK,this.itemClick);
               this.xunzhangItemArr.push(itemface);
            }
            else
            {
               obj = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui//UIditu/newyear/fu.png",35,35);
               obj.x = i * 64;
               this.xunzhangSp.addChild(obj);
               ToolTips.createToolTips(obj,this,function():String
               {
                  return LanResManager.getLanCommonTextWords("勋章领取完成，祝您马年吉祥!");
               });
            }
            i++;
         }
         if(this.xunzhangItemArr.length > 0)
         {
            (this.xunzhangItemArr[0] as ItemFace).showKungFuFram = true;
            this.curSeleteXunzhang = this.xunzhangItemArr[0] as ItemFace;
         }
         this.upDateHuojiang([]);
      }
      
      public function upDateHuojiang(param1:Array) : void
      {
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ += param1[_loc3_] + "<br>";
            _loc3_++;
         }
         this.huojiangTxt.htmlText = "<textformat leading=\'9\'><font size=\'12\'>" + _loc2_ + "</font></textformat>";
      }
      
      public function itemClick(param1:MouseEvent) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:ItemFace = param1.target as ItemFace;
         for each(_loc3_ in this.xunzhangItemArr)
         {
            _loc3_.showKungFuFram = false;
         }
         _loc2_.showKungFuFram = true;
         this.curSeleteXunzhang = _loc2_;
      }
      
      public function chouJiangJieGuo(param1:Boolean) : void
      {
         var gongMc:MovieClip = null;
         var loadUrl:String = null;
         var onEnterFrame:Function = null;
         var choujiangjieguo:Boolean = param1;
         onEnterFrame = function(param1:Event):void
         {
            if(gongMc.currentFrame == gongMc.totalFrames)
            {
               if(Boolean(gongMc) && gongMc.parent != null)
               {
                  gongMc.stop();
                  gongMc.parent.removeChild(gongMc);
                  removeEventListener(Event.ENTER_FRAME,onEnterFrame);
               }
            }
         };
         this.fuSp.visible = false;
         this.maniandajiBG.visible = true;
         gongMc = new MovieClip();
         loadUrl = "";
         if(choujiangjieguo)
         {
            loadUrl = GameConfig.fileBaseFolder + "res/data/mc/newyear/dui.swf";
         }
         else
         {
            loadUrl = GameConfig.fileBaseFolder + "res/data/mc/newyear/cuo.swf";
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            if(Boolean(gongMc) && gongMc.parent != null)
            {
               gongMc.stop();
               gongMc.parent.removeChild(gongMc);
            }
            gongMc = _loc2_.content as MovieClip;
            if(gongMc)
            {
               gongMc.x = 0;
               gongMc.y = -400;
               xunzhangSp.addChild(gongMc);
            }
         },null,false,loadUrl);
         gongMc.addEventListener(Event.ENTER_FRAME,onEnterFrame);
      }
      
      public function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.fuSp:
               this.$parent.dispatchEvent(new BaseEvent(NewYearPanel.QIANDAOPANEL_CHOUJIANG_CLICK));
               break;
            case this.choujiangBtn:
               this.choujiangBtn.visible = false;
               this.maniandajiBG.visible = false;
               this.fuSp.visible = true;
               break;
            case this.lingquxunzhangBtn:
               this.$parent.dispatchEvent(new BaseEvent(NewYearPanel.QIANDAOPANEL_XUNZHANG_CLICK,"",{"id":int(this.curSeleteXunzhang.name)}));
         }
      }
   }
}

