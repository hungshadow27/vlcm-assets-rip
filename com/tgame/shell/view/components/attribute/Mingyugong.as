package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class Mingyugong extends Sprite
   {
      
      public static const UI_MINGYUGONG_GUANBI_CLICK:String = "UI_MINGYUGONG_GUANBI_CLICK";
      
      public var $parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      private var _avatar:Bitmap;
      
      private var juseSprite:Sprite;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var btnTupo:SecondButton;
      
      private var bgCanvas:FCanvas;
      
      private var fta:FTextArea;
      
      private var ftaName:FTextArea;
      
      private var ftaValue:FTextArea;
      
      private var check:FCheckBox;
      
      private var skillSpr:Sprite;
      
      private var mainSkill:Skill;
      
      private var mainSkillContainer:Sprite;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var isDrag:Boolean = false;
      
      private var CurrLV:Boolean = false;
      
      private var mingyugongTupo:MingyugongTupoCanvas;
      
      private var tupoBo:Boolean = false;
      
      private var now:int = 0;
      
      private var mc_:int = -1;
      
      private var mcObj:Object = {};
      
      private var loadUrl1:String;
      
      private var gongMc1:MovieClip;
      
      private var jihuoFt1:FTextArea;
      
      private var check1:FCheckBox;
      
      private var equipContainers:Sprite;
      
      private var kuangHD:Bitmap;
      
      public function Mingyugong()
      {
         super();
         var _loc1_:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/mingyugong/bg.swf");
         _loc1_.x = 0;
         _loc1_.y = 0;
         addChild(_loc1_);
         this.init();
      }
      
      private function init() : void
      {
         var lb:FLabel;
         var $mask:Sprite;
         this.juseSprite = new Sprite();
         this.juseSprite.x = -59 - 20 - 20 + 5 + 5 - 3;
         this.juseSprite.y = 103 + 40 - 60 + 35 - 2;
         addChild(this.juseSprite);
         this._avatar = new Bitmap();
         this.juseSprite.addChildAt(this._avatar,0);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 10;
         this.check.y = 215;
         this.check.addEventListener(MouseEvent.CLICK,this.onClick);
         lb = new FLabel();
         with(lb)
         {
            x = check.x + 25;
            y = 215;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("外观显示");
         }
         addChild(lb);
         this.fta = new FTextArea();
         this.fta.x = 100;
         this.fta.y = 245 + 4;
         this.fta.width = 110;
         this.fta.textColor = StaticValue.ORANGE;
         this.fta.htmlText = "<font size=\'14\'>" + LanResManager.getLanCommonTextWords("明玉功") + "</font>";
         addChild(this.fta);
         this.fta = new FTextArea();
         this.fta.x = 20;
         this.fta.y = 265 + 10;
         this.fta.textColor = StaticValue.WHITE;
         this.fta.multiline = true;
         this.fta.wordWrap = true;
         this.fta.width = 220;
         this.fta.htmlText = "<textformat leading=\'3\'>    " + LanResManager.getLanCommonTextWords("移花宫历代宫主修炼的最高内家绝顶心法。这种功夫共分九层，运功时肌肤透明如玉，功力不往外发挥而是向内收敛，并且体内的真气会形成一股漩涡吸力，对方任何招式都能轻松化解。") + "</textformat>";
         addChild(this.fta);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 120 + 3 - 5;
         this.previousButton.y = 215;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ftaName = new FTextArea();
         with(this.ftaName)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = previousButton.x + 27;
            y = previousButton.y;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanCommonTextWords("第一层");
         }
         addChild(this.ftaName);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = this.previousButton.x + 75;
         this.nextButton.y = this.previousButton.y;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta = new FTextArea();
         this.fta.x = 330 + 10;
         this.fta.y = 25;
         this.fta.width = 65;
         this.fta.textColor = StaticValue.ORANGE;
         this.fta.htmlText = LanResManager.getLanCommonTextWords("被动技能");
         addChild(this.fta);
         this.fta = new FTextArea();
         this.fta.x = 330 + 10;
         this.fta.y = 105;
         this.fta.width = 65;
         this.fta.textColor = StaticValue.ORANGE;
         this.fta.htmlText = LanResManager.getLanCommonTextWords("主动技能");
         addChild(this.fta);
         this.btnTupo = new SecondButton();
         this.btnTupo.x = 330;
         this.btnTupo.y = 185;
         this.btnTupo.label = LanResManager.getLanCommonTextWords("开始领悟");
         addChild(this.btnTupo);
         this.btnTupo.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 265;
            y = 245 + 5;
            textColor = StaticValue.GREEN;
            htmlText = LanResManager.getLanCommonTextWords("人物属性加成：");
         }
         addChild(this.fta);
         this.ftaValue = new FTextArea();
         with(this.ftaValue)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 265;
            y = 262 + 10;
            textColor = StaticValue.GREEN;
            htmlText = "100<br>100<br>100<br>100<br>100";
         }
         addChild(this.ftaValue);
         this.mingyugongTupo = new MingyugongTupoCanvas();
         addChild(this.mingyugongTupo);
         this.mingyugongTupo._parent2 = this;
         this.mingyugongTupo.x = 138;
         this.mingyugongTupo.y = -10;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -10;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,500,390);
            endFill();
         }
         this.mingyugongTupo.mask = $mask;
         addEventListener(UI_MINGYUGONG_GUANBI_CLICK,this.aa1);
         this.skillSpr = new Sprite();
         this.skillSpr.x = 330;
         this.skillSpr.y = 0;
         addChild(this.skillSpr);
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 330;
         this.mainSkillContainer.y = 130;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.jihuoFt1 = new FTextArea();
         this.jihuoFt1.x = 10;
         this.jihuoFt1.y = 10;
         this.jihuoFt1.textColor = StaticValue.GREEN;
         this.jihuoFt1.width = 70;
         this.jihuoFt1.height = 20;
         this.jihuoFt1.htmlText = LanResManager.getLanCommonTextWords("赤焰附体");
         this.jihuoFt1.visible = false;
         addChild(this.jihuoFt1);
         ToolTips.createToolTips(this.jihuoFt1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊属性：攻击+5888，防御+5888，生命加8888" + "<br>" + "特殊技能：攻击时有几率触发赤焰，把对手困在赤焰之中，每次操作都会被火焰" + "<br>" + "灼伤失去当前4%的血量。" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 80;
         this.check1.y = 10;
         this.check1.visible = false;
         this.check1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 9 + 265;
         this.equipContainers.y = 15;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         addChild(this.equipContainers);
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check1:
         }
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.mingyugongTupo._parent2 = param1;
         this.mingyugongTupo._parent = this;
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.mingyugongTupo.x == 138)
            {
               TweenMax.to(this.mingyugongTupo,1,{"x":410});
               this.tupoBo = true;
               this.btnTupo.enabled = false;
               this.previousButton.enabled = false;
               this.nextButton.enabled = false;
            }
         }
         else if(this.mingyugongTupo.x == 410)
         {
            TweenMax.to(this.mingyugongTupo,1,{"x":138});
            this.tupoBo = false;
            this.btnTupo.enabled = true;
            if(this.now == 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(this.now == 9)
            {
               this.nextButton.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
            }
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_MINGYUGONG_ZIDONGTISHENG_CLICKJ,"",false));
         }
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         switch(param1.target)
         {
            case this.check:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_MINGYUGONG_SHOWWAIGUAN,"",this.check.selectState));
               break;
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_MINGYUGONG_PREVIOUS_CLICK,"",this.now - 1));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_MINGYUGONG_PREVIOUS_CLICK,"",this.now + 1));
               break;
            case this.btnTupo:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_MINGYUGONG_DENGJITUPO_CLICKJ,"",this.now));
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if(this.isDrag)
            {
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_MINGYUGONG_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      public function setData(param1:Object, param2:Boolean) : void
      {
         if(param1.nowID >= 1)
         {
            this.CurrLV = true;
         }
         this.isDrag = this.CurrLV;
         this.now = param1.lookID;
         this.setValue(param1.act,param1.def,param1.hp,param1.mp,param1.cp);
         this.showWaiguan(param1.isShow);
         this.setZhaoshi(param1.nowID + 1,param1.lookID);
         this.setSkill(param1.skillID1,param1.skillstate1,param1.skillID2,param1.skillstate2);
         this.ftaName.htmlText = param1.lookName;
         if(param1.nowID == 0)
         {
            this.check.enabled = false;
         }
         else
         {
            this.check.enabled = true;
         }
         this.check1.selectState = param1.check1;
         this.setJiHuo(param2);
      }
      
      private function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.jihuoFt1.visible = GameState.dictMainStatus[SpecialGoodsID.MINGYUGONG_CHIYANFUTI];
            this.check1.visible = false;
         }
         else
         {
            this.jihuoFt1.visible = GameState.dictTargetStatus[SpecialGoodsID.MINGYUGONG_CHIYANFUTI];
            this.check1.visible = false;
         }
      }
      
      public function setMc(param1:int) : void
      {
         var _loc2_:Array = null;
         if(this.gongMc1 != null && this.gongMc1.parent != null)
         {
            this.gongMc1.stop();
            this.gongMc1.parent.removeChild(this.gongMc1);
         }
         if(this.mcObj["gongMc" + param1] != null)
         {
            this.gongMc1 = this.mcObj["gongMc" + param1];
            if(this.gongMc1)
            {
               this.gongMc1.play();
               this.gongMc1.x = 300 - this.gongMc1.width / 2 - 5 - 104 + 78 + 35 - 10;
               this.gongMc1.y = 110 - this.gongMc1.height / 2 + 7 - 115 + 3;
               this.juseSprite.addChildAt(this.gongMc1,1);
            }
         }
         else
         {
            this.loadUrl1 = GameConfig.fileBaseFolder + "res/data/mc/mingyugong/" + param1 + ".swf";
            _loc2_ = [new LoadData(this.loadUrl1,this.com,null,null,"","gongMc" + param1)];
            LoaderManager.load(_loc2_);
         }
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.gongMc1) && this.gongMc1.parent != null)
         {
            this.gongMc1.stop();
            this.gongMc1.parent.removeChild(this.gongMc1);
         }
      }
      
      private function com(param1:Event) : void
      {
         var _loc2_:LoadingItem = param1.target as LoadingItem;
         var _loc3_:String = _loc2_._id;
         if(_loc2_.url.url != this.loadUrl1)
         {
            return;
         }
         if(this.gongMc1 != null && this.gongMc1.parent != null)
         {
            this.gongMc1.stop();
            this.gongMc1.parent.removeChild(this.gongMc1);
         }
         this.gongMc1 = _loc2_.content as MovieClip;
         this.mcObj[_loc3_] = this.gongMc1;
         if(this.gongMc1)
         {
            this.gongMc1.x = 300 - this.gongMc1.width / 2 - 5 - 104 + 78 + 35 - 10;
            this.gongMc1.y = 110 - this.gongMc1.height / 2 + 7 - 115 + 3;
            this.juseSprite.addChildAt(this.gongMc1,1);
         }
      }
      
      private function setSkill(param1:int, param2:int, param3:int, param4:int) : void
      {
         while(this.skillSpr.numChildren > 0)
         {
            this.skillSpr.removeChildAt(0);
         }
         while(this.mainSkillContainer.numChildren > 0)
         {
            this.mainSkillContainer.removeChildAt(0);
         }
         var _loc5_:Skill = new Skill(param1);
         _loc5_.isLearn = param2;
         var _loc6_:ItemFace = new ItemFace(_loc5_);
         _loc6_.x = 24 - 6;
         _loc6_.y = 49;
         _loc6_.setShowCount(false);
         if(_loc5_.isLearn == 0)
         {
            _loc6_.filters = Tools.blackWhiteFilter;
         }
         else
         {
            _loc6_.filters = [];
         }
         this.skillSpr.addChild(_loc6_);
         var _loc7_:Skill = new Skill(param3);
         _loc7_.isLearn = param4;
         var _loc8_:ItemFace = new ItemFace(_loc7_);
         _loc8_.x = 24 - 5;
         _loc8_.y = 2;
         _loc8_.setShowCount(false);
         if(_loc7_.isLearn == 0)
         {
            _loc8_.filters = Tools.blackWhiteFilter;
         }
         else
         {
            _loc8_.filters = [];
         }
         this.mainSkillContainer.addChild(_loc8_);
      }
      
      private function setZhaoshi(param1:int, param2:int) : void
      {
         if(param2 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(param2 == 9)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         if(param1 == param2 || param1 == 0)
         {
            this.btnTupo.label = LanResManager.getLanCommonTextWords("开始领悟");
            this.btnTupo.x = 330;
            this.btnTupo.enabled = true;
         }
         else if(param1 > param2)
         {
            this.btnTupo.label = LanResManager.getLanCommonTextWords("已领悟");
            this.btnTupo.x = 330 + 8;
            this.btnTupo.enabled = false;
         }
         else
         {
            this.btnTupo.label = LanResManager.getLanCommonTextWords("未领悟");
            this.btnTupo.x = 330 + 8;
            this.btnTupo.enabled = false;
         }
      }
      
      private function setValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         var _loc6_:String = "";
         _loc6_ = _loc6_ + ("<textformat leading=\'3\'><font color=\'" + StaticValue.GREEN_HTML + "\'>");
         _loc6_ = _loc6_ + (LanResManager.getLanCommonTextWords("攻击：") + param1 + "<br>" + LanResManager.getLanCommonTextWords("防御：") + param2 + "<br>" + LanResManager.getLanCommonTextWords("生命：") + param3 + "<br>" + LanResManager.getLanCommonTextWords("内力：") + param4 + "<br>" + LanResManager.getLanCommonTextWords("体力：") + param5 + "<br>");
         _loc6_ = _loc6_ + "</font>";
         _loc6_ = _loc6_ + "</textformat>";
         this.ftaValue.htmlText = _loc6_;
      }
      
      public function showWaiguan(param1:Boolean) : void
      {
         this.check.selectState = param1;
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         this.setMc(this.now);
      }
      
      public function setInitialize(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.mingyugongTupo.setInitialize(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.mingyugongTupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean = true) : void
      {
         this.mingyugongTupo.setGoods(param1,param2);
      }
      
      public function setBtn(param1:Boolean) : void
      {
         this.mingyugongTupo.setBtn(param1);
      }
      
      public function setMingYuGongEnabledFun() : void
      {
         this.btnTupo.enabled = false;
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this.check.enabled = false;
      }
      
      public function isMingYuGongtupoCanvasShow() : Boolean
      {
         if(this.mingyugongTupo.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function set_RongQingAiYi(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_20171115RONGQINGAIYI)
            {
               this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
               this.equipContainers.addChild(this.kuangHD);
               this.kuangHD.x = 0;
               this.kuangHD.y = 0;
               _loc4_.x = 2;
               _loc4_.y = 2;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

