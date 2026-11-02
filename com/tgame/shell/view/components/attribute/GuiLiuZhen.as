package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.guiliuzhen.model.info.GuiLiuZhenVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import gs.TweenMax;
   
   public class GuiLiuZhen extends Sprite
   {
      
      public static const UI_GUILIUZHEN_GUANBI_CLICK:String = "UI_GUILIUZHEN_GUANBI_CLICK";
      
      private var bgSpr:Sprite;
      
      private var bg:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var lingWuBtn:SmallButton;
      
      public var $parent:DisplayObject;
      
      private var ZHENFA_MAX:int = 8;
      
      private var dqId:int;
      
      private var miaoshu:FTextArea;
      
      private var shuxing:FTextArea;
      
      private var isDoubleFT:FTextArea;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var guiliuzhenTupo:GuiLiuZhenTupoCanvas;
      
      private var kuang:Bitmap;
      
      private var jinengSpr1:Sprite;
      
      private var jinengSpr2:Sprite;
      
      private var bg1Spr:Sprite;
      
      private var bg2Spr:Sprite;
      
      private var bg3Spr:Sprite;
      
      private var bg4Spr:Sprite;
      
      private var bg5Spr:Sprite;
      
      private var bg6Spr:Sprite;
      
      private var bg7Spr:Sprite;
      
      private var bg8Spr:Sprite;
      
      private var boll1:DisplayObject;
      
      private var boll2:DisplayObject;
      
      private var boll3:DisplayObject;
      
      private var boll4:DisplayObject;
      
      private var boll5:DisplayObject;
      
      private var boll6:DisplayObject;
      
      private var boll7:DisplayObject;
      
      private var boll8:DisplayObject;
      
      private var fts:FTextArea;
      
      private var fts2:FTextArea;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      private var kuangHD:Bitmap;
      
      private var kuangSpr:Sprite;
      
      public function GuiLiuZhen()
      {
         var zhenwu:FTextArea;
         var fujia:FTextArea;
         var fujiajineng:FTextArea;
         var $mask:Sprite;
         super();
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/guiliuzhen/bg.swf");
         this.bg.visible = true;
         this.bg.x = -1;
         this.bg.y = 1;
         this.bgSpr.addChild(this.bg);
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 403;
         this.fc1.height = 366;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 0 + 2;
         this.fc1.y = 1 + 2;
         this.fc1.width = 403 - 4;
         this.fc1.height = 275 - 50 + 23 + 33 - 20 - 2;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 0 + 2;
         this.fc1.y = 282 - 5 - 50 + 23 + 33 - 20 - 2;
         this.fc1.width = 403 - 4;
         this.fc1.height = 80 + 5 + 2 + 50 - 23 - 33 + 20 + 2;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.bg1Spr = new Sprite();
         this.bg1Spr.x = 106 + 1 + 1 + 1 + 1;
         this.bg1Spr.y = 175 - 1;
         addChild(this.bg1Spr);
         this.bg2Spr = new Sprite();
         this.bg2Spr.x = 132 + 1;
         this.bg2Spr.y = 113;
         addChild(this.bg2Spr);
         this.bg3Spr = new Sprite();
         this.bg3Spr.x = 140 + 4;
         this.bg3Spr.y = 40 - 4;
         addChild(this.bg3Spr);
         this.bg4Spr = new Sprite();
         this.bg4Spr.x = 230;
         this.bg4Spr.y = 20;
         addChild(this.bg4Spr);
         this.bg5Spr = new Sprite();
         this.bg5Spr.x = 300 - 1 - 1 - 1;
         this.bg5Spr.y = 80 - 4 + 1;
         addChild(this.bg5Spr);
         this.bg6Spr = new Sprite();
         this.bg6Spr.x = 290;
         this.bg6Spr.y = 150 + 1;
         addChild(this.bg6Spr);
         this.bg7Spr = new Sprite();
         this.bg7Spr.x = 245 - 1;
         this.bg7Spr.y = 150;
         addChild(this.bg7Spr);
         this.bg8Spr = new Sprite();
         this.bg8Spr.x = 177;
         this.bg8Spr.y = 56;
         addChild(this.bg8Spr);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 140 + 5 - 5 - 5;
         this.previousButton.y = 195 - 5 + 10 + 23 + 14;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         addChild(this.cengshu);
         this.cengshu.multiline = true;
         this.cengshu.autoSize = TextFieldAutoSize.CENTER;
         this.cengshu.wordWrap = true;
         this.cengshu.width = 60;
         this.cengshu.height = 30;
         this.cengshu.x = 150 + 26;
         this.cengshu.y = 200 + 23 + 14;
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("第一层") + "</font>";
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 235 - 5 + 10;
         this.nextButton.y = 195 - 5 + 10 + 23 + 14;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lingWuBtn = new SmallButton();
         this.lingWuBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
         addChild(this.lingWuBtn);
         this.lingWuBtn.x = 335 - 23;
         this.lingWuBtn.y = 195 - 1 - 5 + 10 + 23 + 14;
         this.lingWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         zhenwu = new FTextArea();
         addChild(zhenwu);
         zhenwu.multiline = true;
         zhenwu.autoSize = TextFieldAutoSize.CENTER;
         zhenwu.wordWrap = true;
         zhenwu.width = 150;
         zhenwu.height = 30;
         zhenwu.x = 25 + 33;
         zhenwu.y = 265 - 20 + 12 + 8;
         zhenwu.htmlText = "<font size = \'14\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("归流阵") + "</font>";
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.CENTER;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 160;
         this.miaoshu.height = 120;
         this.miaoshu.x = 25 - 12;
         this.miaoshu.y = 280 + 8;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("昆仑派阵法传言天下间没有一个高手可以") + "</font>";
         fujia = new FTextArea();
         addChild(fujia);
         fujia.multiline = true;
         fujia.autoSize = TextFieldAutoSize.CENTER;
         fujia.wordWrap = true;
         fujia.width = 150;
         fujia.height = 30;
         fujia.x = 210 - 18;
         fujia.y = 265 - 20 + 12 + 8;
         fujia.htmlText = "<font size = \'14\' color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("属性增加") + "</font>";
         this.shuxing = new FTextArea();
         addChild(this.shuxing);
         this.shuxing.multiline = true;
         this.shuxing.autoSize = TextFieldAutoSize.CENTER;
         this.shuxing.wordWrap = true;
         this.shuxing.width = 190;
         this.shuxing.height = 130;
         this.shuxing.x = 210 - 18;
         this.shuxing.y = 265 + 12 + 6;
         this.shuxing.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + "<br>" + LanResManager.getLanCommonTextWords("防御：") + "<br>" + LanResManager.getLanCommonTextWords("生命：") + "<br>" + LanResManager.getLanCommonTextWords("内力：") + "<br>" + LanResManager.getLanCommonTextWords("体力：") + "</font>";
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 303 + 20 - 4 + 20 - 3 - 40;
         this.kuang.y = 298 - 39 + 3 + 24;
         this.jinengSpr1 = new Sprite();
         this.jinengSpr1.x = 303 + 20 - 4 + 20 - 3 - 40 + 2;
         this.jinengSpr1.y = 298 - 39 + 3 + 24 + 2;
         addChild(this.jinengSpr1);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 303 + 20 - 4 + 20 - 3;
         this.kuang.y = 298 - 39 + 3 + 24;
         this.jinengSpr2 = new Sprite();
         this.jinengSpr2.x = 303 + 20 - 4 + 20 - 3 + 2;
         this.jinengSpr2.y = 298 - 39 + 3 + 24 + 2;
         addChild(this.jinengSpr2);
         fujiajineng = new FTextArea();
         addChild(fujiajineng);
         fujiajineng.multiline = true;
         fujiajineng.autoSize = TextFieldAutoSize.CENTER;
         fujiajineng.wordWrap = true;
         fujiajineng.width = 150;
         fujiajineng.height = 30;
         fujiajineng.x = 303 + 25 - 18;
         fujiajineng.y = 320 - 8 + 24;
         fujiajineng.htmlText = "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加技能") + "</font>";
         this.fts = new FTextArea();
         this.fts.x = 20;
         this.fts.y = 10;
         this.fts.textColor = StaticValue.RED;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = LanResManager.getLanCommonTextWords("归流阵顶级属性(未激活)");
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击1288888、防御 888888、血量8888888 、暴击 88、闪避88") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 242;
         this.fts2.y = 10;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("归流阵隐藏属性（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("归流阵隐藏属性：") + "<br>" + LanResManager.getLanCommonTextWords("攻击2288888、防御2088888、血量12888888、暴击1000、闪避1000") + "<br>" + LanResManager.getLanCommonTextWords("攻击、防御、血量、暴击、闪避属性全部提升10%") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.guiliuzhenTupo = new GuiLiuZhenTupoCanvas();
         addChild(this.guiliuzhenTupo);
         this.guiliuzhenTupo.x = 138;
         this.guiliuzhenTupo.y = -10;
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
         this.guiliuzhenTupo.mask = $mask;
         addEventListener(UI_GUILIUZHEN_GUANBI_CLICK,this.aa1);
         this.kuangSpr = new Sprite();
         addChild(this.kuangSpr);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 295 - 288;
         this.equipContainers.y = 322 - 73 + 1 - 40;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainers);
         this.kuangHD = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.kuangSpr.addChild(this.kuangHD);
         this.kuangHD.x = 10;
         this.kuangHD.y = 266 - 2 - 1 - 10 - 40;
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.showTuPoPanel(false);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_GUILIUZHEN_SHANGYIYE_CLICK,"",this.lookingId - 1));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_GUILIUZHEN_XIAYIYE_CLICK,"",this.lookingId + 1));
               break;
            case this.lingWuBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_GUILIUZHEN_LINGWU_SHOW,"",this.lookingId));
               this.showTuPoPanel(true);
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.guiliuzhenTupo._parent2 = param1;
         this.guiliuzhenTupo._parent3 = this;
      }
      
      public function setInitialize(param1:Boolean, param2:GuiLiuZhenVO) : void
      {
         this.isMain = param1;
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.miaoshu,param2.act,param2.def,param2.hp,param2.mp,param2.tl);
         this.setZhenFaTiSheng(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skill1,param2.skill2,param2.isLearn1,param2.isLearn2);
         this.setDingJiShuXing(param2.dingJiShuXing);
         this.setJihuo(param2.yincangShuXing);
      }
      
      public function setDingJiShuXing(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("归流阵顶级属性(已激活)");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("归流阵顶级属性(未激活)");
         }
      }
      
      public function setJihuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts2.visible = true;
         }
         else
         {
            this.fts2.visible = false;
         }
      }
      
      private function setBg(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < 8)
         {
            if(this["boll" + String(_loc2_ + 1)])
            {
               if(this["boll" + String(_loc2_ + 1)].parent)
               {
                  this["boll" + String(_loc2_ + 1)].parent.removeChild(this["boll" + String(_loc2_ + 1)]);
               }
            }
            this["boll" + String(_loc2_ + 1)] = null;
            if(_loc2_ < param1)
            {
               this["boll" + String(_loc2_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/guiliuzhen/" + _loc2_ + ".swf");
               this["bg" + String(_loc2_ + 1) + "Spr"].addChild(this["boll" + String(_loc2_ + 1)]);
               this["boll" + String(_loc2_ + 1)].visible = true;
            }
            _loc2_++;
         }
      }
      
      public function setShuxingJiacheng(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + param1 + "</font>";
         this.shuxing.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御：") + param3 + "<br>" + LanResManager.getLanCommonTextWords("生命：") + param4 + "<br>" + LanResManager.getLanCommonTextWords("内力：") + param5 + "<br>" + LanResManager.getLanCommonTextWords("体力：") + param6 + "</font>";
      }
      
      public function setZhenFaTiSheng(param1:String, param2:int, param3:int = -1) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.previousButton.enabled = false;
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
            this.lingWuBtn.enabled = false;
            this.nextButton.enabled = false;
         }
         else
         {
            if(param2 <= 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(param2 >= this.ZHENFA_MAX)
            {
               this.nextButton.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
            }
            if(param2 < param3 + 1)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已领悟");
               this.lingWuBtn.enabled = false;
            }
            else if(param2 == param3 + 1)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("阵法提升");
               this.lingWuBtn.enabled = true;
            }
            else if(param2 > param3 + 1)
            {
               this.lingWuBtn.label = LanResManager.getLanCommonTextWords("不可领悟");
               this.lingWuBtn.enabled = false;
            }
         }
      }
      
      public function setSkill(param1:int, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc6_:ItemFace = null;
         var _loc8_:ItemFace = null;
         while(this.jinengSpr1.numChildren > 0)
         {
            this.jinengSpr1.removeChildAt(0);
         }
         var _loc5_:Skill = new Skill(param1);
         if(param3)
         {
            _loc5_.isLearn = 1;
         }
         else
         {
            _loc5_.isLearn = 0;
         }
         _loc6_ = new ItemFace(_loc5_);
         _loc6_.showKungFuTag();
         _loc6_.setShowCount(false);
         this.jinengSpr1.addChild(_loc6_);
         while(this.jinengSpr2.numChildren > 0)
         {
            this.jinengSpr2.removeChildAt(0);
         }
         var _loc7_:Skill = new Skill(param2);
         if(param4)
         {
            _loc7_.isLearn = 1;
         }
         else
         {
            _loc7_.isLearn = 0;
         }
         _loc8_ = new ItemFace(_loc7_);
         _loc8_.showKungFuTag();
         _loc8_.setShowCount(false);
         this.jinengSpr2.addChild(_loc8_);
      }
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.guiliuzhenTupo.x == 138)
            {
               TweenMax.to(this.guiliuzhenTupo,1,{"x":410});
               this.tupoBo = true;
               this.previousButton.enabled = false;
               this.nextButton.enabled = false;
               this.lingWuBtn.enabled = false;
            }
         }
         else
         {
            if(this.guiliuzhenTupo.x == 410)
            {
               TweenMax.to(this.guiliuzhenTupo,1,{"x":138});
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_GUILIUZHEN_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.previousButton.enabled = true;
            this.nextButton.enabled = true;
            this.lingWuBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.previousButton.enabled = false;
            }
            if(this.lookingId >= this.ZHENFA_MAX)
            {
               this.nextButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.guiliuzhenTupo.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.guiliuzhenTupo.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.guiliuzhenTupo.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.guiliuzhenTupo.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.guiliuzhenTupo.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this.lingWuBtn.enabled = false;
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function set_GuiLiuZhen(param1:Array) : void
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
            if(_loc3_.res.position == ItemPositionRange.POSTION_GUILIUZHEN_SHIHUNTIANGUI)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

