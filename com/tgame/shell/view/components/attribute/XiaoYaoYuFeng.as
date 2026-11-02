package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.xiaoyaoyufeng.model.info.XiaoYaoYuFengVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   import gs.TweenMax;
   
   public class XiaoYaoYuFeng extends Sprite
   {
      
      public static const UI_XIAOYAOYUFENG_GUANBI_CLICK:String = "UI_XIAOYAOYUFENG_GUANBI_CLICK";
      
      private var shangyiyeButton:FSimpleButton;
      
      private var xiayiyeButton:FSimpleButton;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var shezhiBtn:SecondButton;
      
      private var xiaoyaoyufeng:XiaoYaoYuFengTupoCanvas;
      
      public var _$parent:DisplayObject;
      
      public const XIAOYAOYUFENG_MAX:int = 7;
      
      private var nowId:int;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var fc1:FCanvas;
      
      private var miaoshu:FTextArea;
      
      private var bgSpr:Sprite;
      
      private var bg:DisplayObject;
      
      private var bg1Spr:Sprite;
      
      private var bg2Spr:Sprite;
      
      private var bg3Spr:Sprite;
      
      private var bg4Spr:Sprite;
      
      private var bg5Spr:Sprite;
      
      private var bg6Spr:Sprite;
      
      private var bg7Spr:Sprite;
      
      private var boll1:DisplayObject;
      
      private var boll2:DisplayObject;
      
      private var boll3:DisplayObject;
      
      private var boll4:DisplayObject;
      
      private var boll5:DisplayObject;
      
      private var boll6:DisplayObject;
      
      private var boll7:DisplayObject;
      
      private var p:Point;
      
      private var kuang:Bitmap;
      
      private var mainSkill:Skill;
      
      private var mainSkillItemFace:ItemFace;
      
      private var mainSkillContainer:Sprite;
      
      private var currSkill:ItemFace;
      
      public var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var Double:FTextArea;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var mainSkillContainer1:Sprite;
      
      private var kuang1:Bitmap;
      
      private var mainSkillItemFace1:ItemFace;
      
      private var mainSkill1:Skill;
      
      public function XiaoYaoYuFeng()
      {
         var douzhuan:FTextArea;
         var fujia:FTextArea;
         var $mask:Sprite;
         super();
         this.bgSpr = new Sprite();
         addChild(this.bgSpr);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xiaoyaoyufeng/bg.swf");
         this.bg.visible = true;
         this.bg.x = -1 + 4 - 2;
         this.bg.y = 1 + 4 - 2;
         this.bgSpr.addChild(this.bg);
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 403;
         this.fc1.height = 366;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.bg1Spr = new Sprite();
         this.bg1Spr.x = 125;
         this.bg1Spr.y = 21 - 10;
         addChild(this.bg1Spr);
         this.bg2Spr = new Sprite();
         this.bg2Spr.x = 35 + 20;
         this.bg2Spr.y = 60 - 10;
         addChild(this.bg2Spr);
         this.bg3Spr = new Sprite();
         this.bg3Spr.x = 30;
         this.bg3Spr.y = 124 - 10;
         addChild(this.bg3Spr);
         this.bg4Spr = new Sprite();
         this.bg4Spr.x = 50;
         this.bg4Spr.y = 175 - 10;
         addChild(this.bg4Spr);
         this.bg5Spr = new Sprite();
         this.bg5Spr.x = 145 - 5;
         this.bg5Spr.y = 210 + 10 - 10 - 5;
         addChild(this.bg5Spr);
         this.bg6Spr = new Sprite();
         this.bg6Spr.x = 255;
         this.bg6Spr.y = 210 + 5 - 10;
         addChild(this.bg6Spr);
         this.bg7Spr = new Sprite();
         this.bg7Spr.x = 345;
         this.bg7Spr.y = 200 - 10;
         addChild(this.bg7Spr);
         this.shangyiyeButton = new FSimpleButton();
         this.shangyiyeButton.skin = "previousButton";
         addChild(this.shangyiyeButton);
         this.shangyiyeButton.x = 240 + 50 - 45 - 16 - 116 + 30;
         this.shangyiyeButton.y = 205 + 17 + 6 - 4 + 15;
         this.shangyiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cengshu = new FTextArea();
         this.cengshu.autoSize;
         addChild(this.cengshu);
         this.cengshu.multiline = true;
         this.cengshu.autoSize = TextFieldAutoSize.LEFT;
         this.cengshu.wordWrap = true;
         this.cengshu.width = 150;
         this.cengshu.height = 30;
         this.cengshu.x = 180 - 50 + 13 + 45;
         this.cengshu.y = 205 + 17 + 6 - 4 + 15;
         this.cengshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("第一层") + "</font>";
         this.xiayiyeButton = new FSimpleButton();
         this.xiayiyeButton.skin = "nextButton";
         addChild(this.xiayiyeButton);
         this.xiayiyeButton.x = 240 + 50 - 45 - 16 + 15;
         this.xiayiyeButton.y = 205 + 17 + 6 - 4 + 15;
         this.xiayiyeButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50;
         this.tishengBtn.y = 205 + 17 + 6 - 4 + 15;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.shezhiBtn = new SecondButton();
         addChild(this.shezhiBtn);
         this.shezhiBtn.x = 303 + 20 - 8 - 10;
         this.shezhiBtn.y = 230 + 60 - 30 + 20 + 50 - 4 - 3;
         this.shezhiBtn.label = LanResManager.getLanCommonTextWords("设置技能");
         this.shezhiBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         douzhuan = new FTextArea();
         addChild(douzhuan);
         douzhuan.multiline = true;
         douzhuan.autoSize = TextFieldAutoSize.CENTER;
         douzhuan.wordWrap = true;
         douzhuan.width = 150;
         douzhuan.height = 30;
         douzhuan.x = 25 - 12;
         douzhuan.y = 265 - 20 + 12 + 15;
         douzhuan.htmlText = "<font size = \'14\' color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("逍遥御风") + "</font>";
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.autoSize = TextFieldAutoSize.CENTER;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 160;
         this.miaoshu.height = 120;
         this.miaoshu.x = 25 - 12;
         this.miaoshu.y = 280 + 15;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("由慕容世家家传绝学") + "</font>";
         fujia = new FTextArea();
         addChild(fujia);
         fujia.multiline = true;
         fujia.autoSize = TextFieldAutoSize.CENTER;
         fujia.wordWrap = true;
         fujia.width = 100;
         fujia.height = 30;
         fujia.x = 210 - 18 - 17;
         fujia.y = 265 - 20 + 12 + 10 - 1;
         fujia.htmlText = "<font  color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("增加属性") + "</font>";
         this.shuxing = new FTextArea();
         addChild(this.shuxing);
         this.shuxing.multiline = true;
         this.shuxing.autoSize = TextFieldAutoSize.CENTER;
         this.shuxing.wordWrap = true;
         this.shuxing.width = 100;
         this.shuxing.height = 130;
         this.shuxing.x = 210 - 18 - 17;
         this.shuxing.y = 265 + 12 + 6;
         this.shuxing.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + "<br>" + LanResManager.getLanCommonTextWords("防御：") + "<br>" + LanResManager.getLanCommonTextWords("生命：") + "<br>" + LanResManager.getLanCommonTextWords("内力：") + "<br>" + LanResManager.getLanCommonTextWords("体力：") + "</font>";
         this.Double = new FTextArea();
         addChild(this.Double);
         this.Double.multiline = true;
         this.Double.autoSize = TextFieldAutoSize.CENTER;
         this.Double.wordWrap = true;
         this.Double.width = 27;
         this.Double.height = 130;
         this.Double.x = 210 - 18 - 17 + 85 + 5;
         this.Double.y = 265 + 12 + 6;
         this.Double.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>X2<br>X2<br>X2<br>X2<br>X2</font>";
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 303 + 20 - 8;
         this.kuang.y = 230 + 60 - 30 + 20;
         this.mainSkillContainer = new Sprite();
         this.mainSkillContainer.x = 303 + 20 - 8 + 2;
         this.mainSkillContainer.y = 230 + 60 - 30 + 20 + 2;
         addChild(this.mainSkillContainer);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = this.shezhiBtn.x - 30 - 29 + 47;
         this.check.y = this.shezhiBtn.y - 50 + 67 + 7;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("复活后自动使用");
         }
         addChild(this.checkLabel);
         this.xiaoyaoyufeng = new XiaoYaoYuFengTupoCanvas();
         addChild(this.xiaoyaoyufeng);
         this.xiaoyaoyufeng.x = 138;
         this.xiaoyaoyufeng.y = 0;
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
         this.xiaoyaoyufeng.mask = $mask;
         addEventListener(UI_XIAOYAOYUFENG_GUANBI_CLICK,this.onCloseTupo);
         this.fts1 = new FTextArea();
         this.fts1.x = 165 + 73;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("逍遥御风顶级激活（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击388888888防御88888888血量1088888888暴击 8888闪避8888 所有武功提升88层") + "<br>" + LanResManager.getLanCommonTextWords("逍遥醒神录（特殊技能）：激活逍遥醒神录秘技后将可100%抵抗九曲迷魂大法及地狱火鸟迷失技能效果！");
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 20 + 20 + 160 + 33;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("美人计（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("美人妖魅：有着绝色的面容和魔鬼的身材，极具魅惑和妖娆。可锁定任意一个玩家，施发美人技。") + "<br>" + LanResManager.getLanCommonTextWords("妖魅之术，自身可变身成紫衣妖魅，持续10秒；在此状态下，被锁定的玩家和该玩家旁边五格范") + "<br>" + LanResManager.getLanCommonTextWords("围内的所有玩家都将受到美人的妖艳受迷惑，双眼发直，呆滞原地；且当自身处于变成的紫衣妖") + "<br>" + LanResManager.getLanCommonTextWords("魅状态下，每移动一步，所有受迷惑的玩家都将跟着移动，每移动一次对手掉血10%，冷却90秒。");
            return _loc1_ + "</textformat>";
         });
         this.kuang1 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang1);
         this.kuang1.x = 25 + 324 - 340;
         this.kuang1.y = 160 + 35 - 186 + 155 + 33;
         this.mainSkillContainer1 = new Sprite();
         this.mainSkillContainer1.x = 25 + 2 + 324 - 340;
         this.mainSkillContainer1.y = 160 + 2 + 35 - 186 + 155 + 33;
         addChild(this.mainSkillContainer1);
         this.mainSkillContainer1.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown1);
         this.mainSkillContainer1.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp1);
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
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XIAOYAOYUFENG_PREVIOUS_CLICK,"",this.lookingId - 1));
               break;
            case this.xiayiyeButton:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XIAOYAOYUFENG_NEXT_CLICK,"",this.lookingId + 1));
               break;
            case this.tishengBtn:
               this.showTuPoPanel(true);
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XIAOYAOYUFENG_TUPO_CLICK,"",this.lookingId));
               break;
            case this.shezhiBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XIAOYAOYUFENG_SHEZHI_CLICK));
         }
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XIAOYAOYUFENG_ZIDONGSHIYONG_CLICK,"",this.check.selectState));
      }
      
      private function onSkillMouseDown(param1:MouseEvent) : void
      {
         this.mainSkillContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XIAOYAOYUFENG_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
         this.xiaoyaoyufeng._parent2 = param1;
         this.xiaoyaoyufeng._parent3 = this;
      }
      
      public function setInitialize(param1:Boolean, param2:XiaoYaoYuFengVO) : void
      {
         this.setBg(param2.nowLookingID);
         this.setShuxingJiacheng(param2.isDouble,param2.act,param2.def,param2.hp,param2.nl,param2.tl,param2.miaoshu);
         this.setGongFaTiSheng(param2.nowLookingName,param2.nowLookingID,param2.nowID);
         this.setSkill(param2.skillid,param2.isLearn);
         this.setZiDong(param2.isZidong);
         this.setJiHuo(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.XIAOYAOYUFENG_DINGJI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.XIAOYAOYUFENG_MEIRENJI_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.XIAOYAOYUFENG_MEIRENJI_ID])
            {
               this.setSkillJiHuo1(200277,true);
               this.mainSkillContainer1.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer1.visible = false;
               this.kuang1.visible = false;
            }
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.XIAOYAOYUFENG_DINGJI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.XIAOYAOYUFENG_MEIRENJI_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.XIAOYAOYUFENG_MEIRENJI_ID])
            {
               this.setSkillJiHuo1(200277,true);
               this.mainSkillContainer1.visible = true;
               this.kuang1.visible = true;
            }
            else
            {
               this.mainSkillContainer1.visible = false;
               this.kuang1.visible = false;
            }
         }
      }
      
      private function setZiDong(param1:Boolean) : void
      {
         this.check.selectState = param1;
      }
      
      private function setBg(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < 7)
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
               this["boll" + String(_loc2_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xiaoyaoyufeng/liang.swf");
            }
            else
            {
               this["boll" + String(_loc2_ + 1)] = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/xiaoyaoyufeng/an.swf");
            }
            this["bg" + String(_loc2_ + 1) + "Spr"].addChild(this["boll" + String(_loc2_ + 1)]);
            this["boll" + String(_loc2_ + 1)].visible = true;
            _loc2_++;
         }
      }
      
      public function setShuxingJiacheng(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:String) : void
      {
         this.shuxing.htmlText = "<textformat leading=\'0.1\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + param2 + "<br>" + LanResManager.getLanCommonTextWords("防御：") + param3 + "<br>" + LanResManager.getLanCommonTextWords("生命：") + param4 + "<br>" + LanResManager.getLanCommonTextWords("内力：") + param5 + "<br>" + LanResManager.getLanCommonTextWords("体力：") + param6 + "</font></textformat>";
         if(param1)
         {
            this.Double.visible = true;
         }
         else
         {
            this.Double.visible = false;
         }
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + param7 + "</font>";
      }
      
      public function setSkill(param1:int, param2:Boolean) : void
      {
         while(this.mainSkillContainer.numChildren > 0)
         {
            this.mainSkillContainer.removeChildAt(0);
         }
         if(this.mainSkillItemFace)
         {
            if(this.mainSkillItemFace.parent)
            {
               this.mainSkillItemFace.parent.removeChild(this.mainSkillItemFace);
            }
         }
         var _loc3_:Skill = new Skill(param1);
         this.mainSkill = _loc3_;
         if(param2)
         {
            this.mainSkill.isLearn = 1;
            this.shezhiBtn.enabled = true;
         }
         else
         {
            this.mainSkill.isLearn = 0;
            this.shezhiBtn.enabled = false;
         }
         this.mainSkillItemFace = new ItemFace(this.mainSkill);
         this.mainSkillItemFace.showKungFuTag();
         this.mainSkillItemFace.setShowCount(false);
         this.mainSkillContainer.addChild(this.mainSkillItemFace);
      }
      
      public function setGongFaTiSheng(param1:String, param2:int, param3:int = -1) : void
      {
         this.cengshu.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.nowId = param3;
         this.lookingId = param2;
         if(this.tupoBo)
         {
            this.shangyiyeButton.enabled = false;
            this.tishengBtn.label = LanResManager.getLanCommonTextWords("功法提升");
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
            if(param2 >= this.XIAOYAOYUFENG_MAX)
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
      
      public function showTuPoPanel(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.xiaoyaoyufeng.x == 138)
            {
               TweenMax.to(this.xiaoyaoyufeng,1,{"x":410});
               this.tupoBo = true;
               this.shangyiyeButton.enabled = false;
               this.xiayiyeButton.enabled = false;
               this.tishengBtn.enabled = false;
            }
         }
         else
         {
            if(this.xiaoyaoyufeng.x == 410)
            {
               TweenMax.to(this.xiaoyaoyufeng,1,{"x":138});
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_XIAOYAOYUFENG_ZIDONGTISHENG_CLICK,"",false));
            }
            this.tupoBo = false;
            this.shangyiyeButton.enabled = true;
            this.xiayiyeButton.enabled = true;
            this.tishengBtn.enabled = true;
            if(this.lookingId == 1)
            {
               this.shangyiyeButton.enabled = false;
            }
            if(this.lookingId >= this.XIAOYAOYUFENG_MAX)
            {
               this.xiayiyeButton.enabled = false;
            }
         }
      }
      
      public function isTupoCanvasShow() : Boolean
      {
         if(this.xiaoyaoyufeng.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setTupoInit(param1:String, param2:String, param3:Boolean, param4:String, param5:int, param6:Boolean, param7:int) : void
      {
         this.xiaoyaoyufeng.setTupoInit(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.xiaoyaoyufeng.setZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.xiaoyaoyufeng.setGoods(param1,param2);
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         this.xiaoyaoyufeng.setTuPoBtn(param1);
      }
      
      public function setEnableFun() : void
      {
         this.shangyiyeButton.enabled = false;
         this.xiayiyeButton.enabled = false;
         this.tishengBtn.enabled = false;
         this.check.visible = false;
         this.checkLabel.visible = false;
         this.shezhiBtn.enabled = false;
      }
      
      private function onSkillMouseDown1(param1:MouseEvent) : void
      {
         this.mainSkillContainer1.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove1(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
         }
      }
      
      private function onSkillMouseUp1(param1:MouseEvent) : void
      {
         this.mainSkillContainer1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove1);
      }
      
      public function setSkillJiHuo1(param1:int, param2:Boolean) : void
      {
         while(this.mainSkillContainer1.numChildren > 0)
         {
            this.mainSkillContainer1.removeChildAt(0);
         }
         if(this.mainSkillItemFace1)
         {
            if(this.mainSkillItemFace1.parent)
            {
               this.mainSkillItemFace1.parent.removeChild(this.mainSkillItemFace1);
            }
         }
         var _loc3_:Skill = new Skill(param1);
         this.mainSkill1 = _loc3_;
         if(param2)
         {
            this.mainSkill1.isLearn = 1;
         }
         else
         {
            this.mainSkill1.isLearn = 0;
         }
         this.mainSkillItemFace1 = new ItemFace(this.mainSkill1);
         this.mainSkillItemFace1.showKungFuTag();
         this.mainSkillItemFace1.setShowCount(false);
         this.mainSkillContainer1.addChild(this.mainSkillItemFace1);
      }
   }
}

