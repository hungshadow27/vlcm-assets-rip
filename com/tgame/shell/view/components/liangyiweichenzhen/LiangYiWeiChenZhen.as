package com.tgame.shell.view.components.liangyiweichenzhen
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.liangyiweichenzhen.model.info.LiangYiWeiChenZhenVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import gs.TweenMax;
   
   public class LiangYiWeiChenZhen extends Sprite
   {
      
      public static const UI_LIANGYIWEICHENZHEN_GUANBI_CLICK:String = "UI_LIANGYIWEICHENZHEN_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var liangyiweichenzhen:LiangYiWeiChenZhenTupoCanvas;
      
      private var _$parent:DisplayObject;
      
      public const CANHEZHI_MAX:int = 6;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      private var isMain:Boolean;
      
      private var jihuoSpr:Sprite;
      
      private var boll1:DisplayObject;
      
      private var boll2:DisplayObject;
      
      private var boll3:DisplayObject;
      
      private var boll4:DisplayObject;
      
      private var boll5:DisplayObject;
      
      private var boll6:DisplayObject;
      
      private var jihuoBtn1:SecondButton;
      
      private var jihuoBtn2:SecondButton;
      
      private var jihuoBtn3:SecondButton;
      
      private var jihuoBtn4:SecondButton;
      
      private var jihuoBtn5:SecondButton;
      
      private var jihuoBtn6:SecondButton;
      
      private var arrX:Array;
      
      private var arrY:Array;
      
      private var shuoMingCanvas:FCanvas;
      
      private var helpBtn:FSimpleButton;
      
      private var riyinSpr:Sprite;
      
      private var riyin:MovieClip;
      
      private var shuomingSpr:Sprite;
      
      private var shuomingObl:DisplayObject;
      
      public function LiangYiWeiChenZhen()
      {
         var title:FTextArea;
         var $mask:Sprite;
         var box:FCanvas = null;
         var loadUrl1:String = null;
         var fjjn:FTextArea = null;
         this.arrX = [62,163,262,225,100,163];
         this.arrY = [120,45,120,238,238,155];
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 0;
         box.y = 0;
         box.width = 403;
         box.height = 366;
         box = new FCanvas();
         box.skin = "box";
         box.x = 2;
         box.y = 231 + 32 - 25;
         box.width = 400;
         box.height = 135 - 32 + 25;
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/liangyiweichenzhen/bg.swf");
         this.bg.x = 2;
         this.bg.y = 2;
         addChild(this.bg);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2;
         this.bloodMcSpr.y = 2;
         addChild(this.bloodMcSpr);
         this.jihuoSpr = new Sprite();
         addChild(this.jihuoSpr);
         this.riyinSpr = new Sprite();
         this.jihuoSpr.addChild(this.riyinSpr);
         this.shuomingSpr = new Sprite();
         this.shuomingSpr.x = 415;
         this.shuomingSpr.y = 110;
         addChild(this.shuomingSpr);
         loadUrl1 = GameConfig.fileBaseFolder + "res/ui/UIditu/liangyiweichenzhen/texiao.swf";
         this.riyin = new MovieClip();
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl1)
            {
               return;
            }
            riyin = _loc2_.content as MovieClip;
            if(riyin)
            {
               riyin.visible = false;
               riyin.play();
               riyin.x = -5;
               riyin.y = 7 - 16;
               riyinSpr.addChild(riyin);
            }
         },null,false,loadUrl1);
         this.shuoMingCanvas = new FCanvas();
         this.shuoMingCanvas.skin = "menuBg";
         this.shuoMingCanvas.x = 415;
         this.shuoMingCanvas.y = 110;
         this.shuoMingCanvas.width = 140 + 25;
         this.shuoMingCanvas.height = 150;
         this.helpBtn = new FSimpleButton();
         this.helpBtn.skin = "helpBtn";
         addChild(this.helpBtn);
         this.helpBtn.x = 360;
         this.helpBtn.y = 10;
         this.helpBtn.toolTip = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + "注：" + "<br>" + "1、功法突破后，属性将永久获得；" + "<br>" + "2、法门对应不同技能，同时只能激活一种技能效果；" + "<br>" + "3、法门间切换CD10秒；" + "<br>";
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 37 + 6;
         this.shangyiyeButton.y = 205 + 25 - 20 + 25 - 18 - 3 + 7 + 120;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.cengshu.autoSize;
         addChild(this.cengshu);
         this.cengshu.defaultTextFormat = this.tf;
         this.cengshu.background = true;
         this.cengshu.backgroundColor = 1186072;
         this.cengshu.width = 59;
         this.cengshu.height = 17;
         this.cengshu.x = 170 + 6;
         this.cengshu.y = 230 - 20 + 25 - 18 - 3 + 7 + 120;
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16 + 6;
         this.xiayiyeButton.y = 205 + 25 - 20 + 25 - 18 - 3 + 7 + 120;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50 + 20 + 17;
         this.tishengBtn.y = 205 + 25 - 20 + 25 - 18 - 3 - 3 + 7 + 120;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 24 + 50;
         title.y = 250 + 12 - 15 + 23 - 21 - 13;
         title.textColor = StaticValue.ORANGE;
         title.htmlText = "<textformat leading=\'50\'><font size = \'16\' color=\'" + StaticValue.ORANGE_RED_HTML + "\'>" + "七杀阵" + "</font></textformat>";
         this.miaoshu = new FTextArea();
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.LEFT;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 120;
         this.miaoshu.x = 20;
         this.miaoshu.y = 20;
         this.miaoshu.htmlText = "";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 100 + 10 + 20;
         this.shuxing.height = 110;
         this.shuxing.x = 210 + 13 + 14;
         this.shuxing.y = 288 + 7 - 21 - 15;
         this.shuxing.textColor = StaticValue.ORANGE;
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9 + 36;
         fjjn.y = 255 + 5 + 5 + 6 + 22;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("顶级技能") + "</font></textformat>";
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuang.x = 325 - 2 + 33;
         this.kuang.y = 300 - 2 + 20;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 325 + 33;
         this.jinengSpr.y = 300 + 20;
         addChild(this.jinengSpr);
         this.liangyiweichenzhen = new LiangYiWeiChenZhenTupoCanvas();
         addChild(this.liangyiweichenzhen);
         this.liangyiweichenzhen.x = 138;
         this.liangyiweichenzhen.y = 0;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -5;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.liangyiweichenzhen.mask = $mask;
         addEventListener(UI_LIANGYIWEICHENZHEN_GUANBI_CLICK,this.onCloseTupo);
         this.mcObj = new Array();
         this.equipContainers = new Sprite();
         this.equipContainers.x = 343 + 8;
         this.equipContainers.y = 12 + 30 + 135 + 65;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         var _loc2_:Object = param1.target;
         switch(0)
         {
         }
      }
      
      private function onCloseTupo(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.shangyiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANGYIWEICHENZHEN_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANGYIWEICHENZHEN_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANGYIWEICHENZHEN_TUPO_CLICK,"",this.lookingId));
               this.showTuPoPanel(true);
               break;
            case this.jihuoBtn1:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANGYIWEICHENZHEN_JIHUO_CLICK,"",1));
               break;
            case this.jihuoBtn2:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANGYIWEICHENZHEN_JIHUO_CLICK,"",2));
               break;
            case this.jihuoBtn3:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANGYIWEICHENZHEN_JIHUO_CLICK,"",3));
               break;
            case this.jihuoBtn4:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANGYIWEICHENZHEN_JIHUO_CLICK,"",4));
               break;
            case this.jihuoBtn5:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANGYIWEICHENZHEN_JIHUO_CLICK,"",5));
               break;
            case this.jihuoBtn6:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANGYIWEICHENZHEN_JIHUO_CLICK,"",6));
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.liangyiweichenzhen._parent2 = param1;
         this.liangyiweichenzhen._parent3 = this;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:LiangYiWeiChenZhenVo) : void
      {
         this.isMain = param1;
         this.setShuxingJiacheng(param2.miaoshu,param2.act,param2.def,param2.hp,param2.baoji,param2.shanbi);
         this.setZhaoShiMsg(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.yuyidengji(param2.nowLookingID,param2.nowID,param2.nowJiHuoID);
         this.setJiHuo(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
         }
      }
      
      private function setBg(param1:int) : void
      {
         var loadUrl:String = null;
         var mcId:int = param1;
         loadUrl = GameConfig.fileBaseFolder + "res/data/mc/liangyiweichenzhen/" + mcId + ".swf";
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         if(this.mcObj[mcId] != null)
         {
            this.bloodMc = this.mcObj[mcId];
            this.bloodMc.play();
            this.bloodMcSpr.addChild(this.bloodMc);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(bloodMc) && bloodMc.parent != null)
               {
                  bloodMc.stop();
                  bloodMc.parent.removeChild(bloodMc);
               }
               while(bloodMcSpr.numChildren > 0)
               {
                  bloodMcSpr.removeChildAt(0);
               }
               bloodMc = _loc2_.content as MovieClip;
               mcObj[mcId] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
      }
      
      public function setShuxingJiacheng(param1:String, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + param1 + "</font>";
      }
      
      public function setZhaoShiMsg(param1:String, param2:int, param3:int = -1) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.shangyiyeButton.enabled = false;
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
            this.tishengBtn.enabled = false;
            this.xiayiyeButton.enabled = false;
         }
         else
         {
            if(param2 <= 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            else
            {
               this.shangyiyeButton.enabled = true;
            }
            if(param2 >= this.CANHEZHI_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
            else
            {
               this.xiayiyeButton.enabled = true;
            }
            if(param2 < param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("已领悟");
               this.tishengBtn.enabled = false;
            }
            else if(param2 == param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
               this.tishengBtn.enabled = true;
            }
            else if(param2 > param3 + 1)
            {
               this.tishengBtn.label = LanResManager.getLanCommonTextWords("不可领悟");
               this.tishengBtn.enabled = false;
            }
         }
      }
      
      private function yuyidengji(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         while(_loc4_ < 6)
         {
            if(this["boll" + String(_loc4_ + 1)])
            {
               if(this["boll" + String(_loc4_ + 1)].parent)
               {
                  this["boll" + String(_loc4_ + 1)].parent.removeChild(this["boll" + String(_loc4_ + 1)]);
               }
            }
            this["boll" + String(_loc4_ + 1)] = null;
            this["jihuoBtn" + String(_loc4_ + 1)] = new SecondButton();
            this.jihuoSpr.addChild(this["jihuoBtn" + String(_loc4_ + 1)]);
            this["jihuoBtn" + String(_loc4_ + 1)].x = this.arrX[_loc4_] + 20;
            this["jihuoBtn" + String(_loc4_ + 1)].y = this.arrY[_loc4_] + 70;
            this["jihuoBtn" + String(_loc4_ + 1)].label = "激活";
            this["jihuoBtn" + String(_loc4_ + 1)].addEventListener(MouseEvent.CLICK,this.onClick);
            if(_loc4_ < param2)
            {
               this["jihuoBtn" + String(_loc4_ + 1)].enabled = true;
               this["boll" + String(_loc4_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/liangyiweichenzhen/" + _loc4_ + "_1.swf");
            }
            else
            {
               this["jihuoBtn" + String(_loc4_ + 1)].enabled = false;
               this["boll" + String(_loc4_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/liangyiweichenzhen/" + _loc4_ + "_0.swf");
            }
            if(_loc4_ == param3 - 1)
            {
               this["jihuoBtn" + String(_loc4_ + 1)].enabled = false;
            }
            while(this.shuomingSpr.numChildren > 0)
            {
               this.shuomingSpr.removeChildAt(0);
            }
            if(param3 > 0)
            {
               this.riyinSpr.x = this.arrX[param3 - 1];
               this.riyinSpr.y = this.arrY[param3 - 1];
               this.riyin.visible = true;
               this.riyinSpr.visible = true;
               this.shuomingObl = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/liangyiweichenzhen/" + param3 + ".swf");
               this.shuomingObl.x = 2;
               this.shuomingObl.y = 2;
               this.shuomingSpr.addChild(this.shuomingObl);
            }
            else
            {
               this.riyinSpr.visible = false;
               this.riyin.visible = false;
            }
            this.jihuoSpr.addChildAt(this["boll" + String(_loc4_ + 1)],0);
            this["boll" + String(_loc4_ + 1)].x = this.arrX[_loc4_];
            this["boll" + String(_loc4_ + 1)].y = this.arrY[_loc4_];
            this["boll" + String(_loc4_ + 1)].visible = true;
            _loc4_++;
         }
      }
      
      public function setSkill(param1:int, param2:Boolean) : void
      {
         var _loc4_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc3_:Skill = new Skill(param1);
         if(param2)
         {
            _loc3_.isLearn = 1;
         }
         else
         {
            _loc3_.isLearn = 0;
         }
         _loc4_ = new ItemFace(_loc3_);
         _loc4_.showKungFuTag();
         _loc4_.setShowCount(false);
         this.jinengSpr.addChild(_loc4_);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.liangyiweichenzhen.x == 138)
            {
               TweenMax.to(this.liangyiweichenzhen,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.liangyiweichenzhen.x == 410)
            {
               TweenMax.to(this.liangyiweichenzhen,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LIANGYIWEICHENZHEN_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.CANHEZHI_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.liangyiweichenzhen.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.liangyiweichenzhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.liangyiweichenzhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.liangyiweichenzhen.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.liangyiweichenzhen.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_LiangYiWeiChenZhen(param1:Array) : void
      {
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
      }
   }
}

