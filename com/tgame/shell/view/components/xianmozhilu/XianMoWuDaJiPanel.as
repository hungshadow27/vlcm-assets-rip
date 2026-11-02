package com.tgame.shell.view.components.xianmozhilu
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewSkinButton;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Skill;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class XianMoWuDaJiPanel extends FPanel
   {
      
      public static const UI_XIANMOWUDAJI_XIULIAN:String = "UI_XIANMOWUDAJI_XIULIAN";
      
      public static const UI_XIANMOWUDAJI_XIDIAN:String = "UI_XIANMOWUDAJI_XIDIAN";
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var xiulianBtn0:NewSkinButton;
      
      private var xiulianBtn1:NewSkinButton;
      
      private var xiulianBtn2:NewSkinButton;
      
      private var xiulianBtn3:NewSkinButton;
      
      private var xiulianBtn4:NewSkinButton;
      
      private var xiulianBtn5:NewSkinButton;
      
      private var xiulianBtn6:NewSkinButton;
      
      private var xiulianBtn7:NewSkinButton;
      
      private var xiulianBtn8:NewSkinButton;
      
      private var xiulianBtn9:NewSkinButton;
      
      private var xiulianBtn10:NewSkinButton;
      
      private var xiulianBtn11:NewSkinButton;
      
      private var xiulianBtn12:NewSkinButton;
      
      private var xiulianBtn13:NewSkinButton;
      
      private var xiulianBtn14:NewSkinButton;
      
      private var xlBtn0:SecondButton;
      
      private var xlBtn1:SecondButton;
      
      private var xlBtn2:SecondButton;
      
      private var xlBtn3:SecondButton;
      
      private var xlBtn4:SecondButton;
      
      private var xlBtn5:SecondButton;
      
      private var xlBtn6:SecondButton;
      
      private var xlBtn7:SecondButton;
      
      private var xlBtn8:SecondButton;
      
      private var xlBtn9:SecondButton;
      
      private var xlBtn10:SecondButton;
      
      private var xlBtn11:SecondButton;
      
      private var xlBtn12:SecondButton;
      
      private var xlBtn13:SecondButton;
      
      private var xlBtn14:SecondButton;
      
      private var lv0:FTextArea;
      
      private var lv1:FTextArea;
      
      private var lv2:FTextArea;
      
      private var lv3:FTextArea;
      
      private var lv4:FTextArea;
      
      private var lv5:FTextArea;
      
      private var lv6:FTextArea;
      
      private var lv7:FTextArea;
      
      private var lv8:FTextArea;
      
      private var lv9:FTextArea;
      
      private var lv10:FTextArea;
      
      private var lv11:FTextArea;
      
      private var lv12:FTextArea;
      
      private var lv13:FTextArea;
      
      private var lv14:FTextArea;
      
      private var zuoArr:Array;
      
      private var shengyuFt1:FTextArea;
      
      private var shengyuFt2:FTextArea;
      
      private var xidianBtn1:NewSkinButton;
      
      private var xidianBtn2:NewSkinButton;
      
      private var skillSpr:Sprite;
      
      public function XianMoWuDaJiPanel()
      {
         var i:int;
         var bg1:DisplayObject = null;
         var bg2:DisplayObject = null;
         var shuoming:FTextArea = null;
         this.zuoArr = [];
         super();
         this.titleText = "";
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 400 + 51 + 223;
         height = 350 + 112 + 70;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/xianmowudaji/bg.swf");
         bg1.x = 10;
         bg1.y = 2;
         addChild(bg1);
         bg2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/xianmowudaji/biaoti.swf");
         bg2.x = 100;
         bg2.y = -90;
         addChild(bg2);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.multiline = true;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.x = 7;
         this.tip.y = 3;
         this.tipCanvas.addChild(this.tip);
         shuoming = new FTextArea();
         addChild(shuoming);
         shuoming.multiline = true;
         shuoming.autoSize = TextFieldAutoSize.LEFT;
         shuoming.wordWrap = true;
         shuoming.width = 60;
         shuoming.x = 30;
         shuoming.y = 450;
         shuoming.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'><u>" + "玩法说明" + "</u></font>";
         ToolTips.createToolTips(shuoming,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "玩家每提升一级可获得技能3点；玩家每提升5级可获得五行点1点。" + "<br>" + "玩家可消耗技能点给五行附属技能升级，最高可提升至100级，附属技能效果只有对应" + "<br>" + "五行技能触发时才会生效。" + "<br>" + "玩家可消耗五行点给五行技能升级，最高可提升至20。" + "<br>" + "五行技能修炼后可在战斗时发挥强大的作用。" + "<br>" + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.shengyuFt1 = new FTextArea();
         addChild(this.shengyuFt1);
         this.shengyuFt1.multiline = true;
         this.shengyuFt1.autoSize = TextFieldAutoSize.LEFT;
         this.shengyuFt1.wordWrap = true;
         this.shengyuFt1.width = 230 - 12;
         this.shengyuFt1.x = 200;
         this.shengyuFt1.y = 420;
         this.shengyuFt1.htmlText = "<font size = \'16\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + "剩余技能点" + "</font>";
         this.shengyuFt2 = new FTextArea();
         addChild(this.shengyuFt2);
         this.shengyuFt2.multiline = true;
         this.shengyuFt2.autoSize = TextFieldAutoSize.LEFT;
         this.shengyuFt2.wordWrap = true;
         this.shengyuFt2.width = 230 - 12;
         this.shengyuFt2.x = 200;
         this.shengyuFt2.y = 420 + 40;
         this.shengyuFt2.htmlText = "<font size = \'16\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + "剩余五行点" + "</font>";
         this.xidianBtn1 = new NewSkinButton();
         this.xidianBtn1.skin = "wdj_xidian_Button";
         this.xidianBtn1.x = 360;
         this.xidianBtn1.y = 415;
         addChild(this.xidianBtn1);
         this.xidianBtn1.addEventListener(MouseEvent.CLICK,this.onClick1);
         this.xidianBtn2 = new NewSkinButton();
         this.xidianBtn2.skin = "wdj_xidian_Button";
         this.xidianBtn2.x = 360;
         this.xidianBtn2.y = 455;
         addChild(this.xidianBtn2);
         this.xidianBtn2.addEventListener(MouseEvent.CLICK,this.onClick1);
         i = 0;
         while(i < 15)
         {
            bg2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/xianmowudaji/lvbg.swf");
            bg2.x = 101 * (i % 5) + 50;
            bg2.y = 101 * int(i / 5) + 110;
            bg2.name = String(i);
            addChild(bg2);
            this["lv" + String(i)] = new FTextArea();
            addChild(this["lv" + String(i)]);
            this["lv" + String(i)].multiline = true;
            this["lv" + String(i)].autoSize = TextFieldAutoSize.LEFT;
            this["lv" + String(i)].wordWrap = true;
            this["lv" + String(i)].width = 230 - 12;
            this["lv" + String(i)].x = 101 * (i % 5) + 10 + 50 - 5;
            this["lv" + String(i)].y = 101 * int(i / 5) + 110 + 2;
            this["lv" + String(i)].htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + "LV54" + "</font>";
            bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/xianmowudaji/" + (i + 1) + ".swf");
            bg1.x = 101 * (i % 5) + 40;
            bg1.y = 101 * int(i / 5) + 40;
            bg1.name = String(i);
            addChild(bg1);
            bg1.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip);
            bg1.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip);
            this["xiulianBtn" + String(i)] = new NewSkinButton();
            this["xiulianBtn" + String(i)].skin = "wdj_shengji_Button";
            this["xiulianBtn" + String(i)].x = 101 * (i % 5) + 50 + 35 + 10;
            this["xiulianBtn" + String(i)].y = 101 * int(i / 5) + 105 + 3;
            this["xiulianBtn" + String(i)].name = String(i + 1);
            addChild(this["xiulianBtn" + String(i)]);
            this["xiulianBtn" + String(i)].addEventListener(MouseEvent.CLICK,this.onClick);
            this["xlBtn" + String(i)] = new SecondButton();
            this["xlBtn" + String(i)].label = "修炼";
            this["xlBtn" + String(i)].x = 101 * (i % 5) + 50;
            this["xlBtn" + String(i)].y = 101 * int(i / 5) + 110;
            this["xlBtn" + String(i)].name = String(i + 1);
            addChild(this["xlBtn" + String(i)]);
            this["xlBtn" + String(i)].addEventListener(MouseEvent.CLICK,this.onClick);
            i++;
         }
         this.skillSpr = new Sprite();
         this.skillSpr.x = 580;
         this.skillSpr.y = 40;
         addChild(this.skillSpr);
      }
      
      public function onClose(param1:* = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.target.name);
         dispatchEvent(new BaseEvent(XianMoWuDaJiPanel.UI_XIANMOWUDAJI_XIULIAN,"",_loc2_));
      }
      
      private function onClick1(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         var type:int = int(e.target.name);
         switch(e.target)
         {
            case this.xidianBtn1:
               FAlert.okLabel = "是";
               FAlert.cancelLabel = "否";
               FAlert.show("确定消耗五大技能洗练丹进行重置技能点吗？","",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     dispatchEvent(new BaseEvent(XianMoWuDaJiPanel.UI_XIANMOWUDAJI_XIDIAN,"",1));
                  }
               });
               break;
            case this.xidianBtn2:
               FAlert.okLabel = "是";
               FAlert.cancelLabel = "否";
               FAlert.show("确定消耗五行技能洗练丹进行重置五行点吗？","",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     dispatchEvent(new BaseEvent(XianMoWuDaJiPanel.UI_XIANMOWUDAJI_XIDIAN,"",2));
                  }
               });
         }
      }
      
      public function setPanel(param1:Array, param2:Array = null, param3:int = 0, param4:int = 0) : void
      {
         this.zuoArr = param1;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            if(param1[_loc5_].lv > 0)
            {
               this["xiulianBtn" + String(_loc5_)].visible = true;
               this["xlBtn" + String(_loc5_)].visible = false;
               this["lv" + String(_loc5_)].visible = true;
               this["lv" + String(_loc5_)].htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + "LV" + param1[_loc5_].lv + "</font>";
            }
            else
            {
               this["xiulianBtn" + String(_loc5_)].visible = false;
               this["xlBtn" + String(_loc5_)].visible = true;
               this["lv" + String(_loc5_)].visible = false;
            }
            _loc5_++;
         }
         this.shengyuFt1.htmlText = "<font size = \'16\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + "剩余技能点：" + param3 + "</font>";
         this.shengyuFt2.htmlText = "<font size = \'16\' color=\'" + StaticValue.GREEN_HTML + "\'>" + "剩余五行点：" + param4 + "</font>";
         this.setSkill(param2);
      }
      
      private function setSkill(param1:Array) : void
      {
         var _loc3_:Skill = null;
         var _loc4_:ItemFace = null;
         var _loc5_:DisplayObject = null;
         var _loc6_:FTextArea = null;
         var _loc7_:NewSkinButton = null;
         var _loc8_:SecondButton = null;
         while(this.skillSpr.numChildren > 0)
         {
            this.skillSpr.removeChildAt(0);
         }
         if(param1 == null)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = new Skill(param1[_loc2_].id);
            _loc3_.isLearn = 1;
            _loc4_ = new ItemFace(_loc3_);
            _loc4_.showKungFuTag();
            _loc4_.setShowCount(false);
            _loc4_.y = 88 * _loc2_;
            this.skillSpr.addChild(_loc4_);
            if(param1[_loc2_].lv > 0)
            {
               _loc5_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/xianmozhilu/xianmowudaji/lvbg.swf");
               _loc5_.x = _loc4_.x;
               _loc5_.y = _loc4_.y + 50;
               this.skillSpr.addChild(_loc5_);
               _loc6_ = new FTextArea();
               this.skillSpr.addChild(_loc6_);
               _loc6_.multiline = true;
               _loc6_.autoSize = TextFieldAutoSize.LEFT;
               _loc6_.wordWrap = true;
               _loc6_.width = 230 - 12;
               _loc6_.x = _loc4_.x + 2;
               _loc6_.y = _loc4_.y + 50;
               _loc6_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + "LV" + param1[_loc2_].lv + "</font>";
               _loc7_ = new NewSkinButton();
               _loc7_.skin = "wdj_shengji_Button";
               _loc7_.x = _loc4_.x + 50;
               _loc7_.y = _loc4_.y + 50;
               _loc7_.name = String(_loc2_ + 16);
               this.skillSpr.addChild(_loc7_);
               _loc7_.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            else
            {
               _loc8_ = new SecondButton();
               _loc8_.label = "修炼";
               _loc8_.x = _loc4_.x + 10 - 15;
               _loc8_.y = _loc4_.y + 50;
               _loc8_.name = String(_loc2_ + 16);
               this.skillSpr.addChild(_loc8_);
               _loc8_.addEventListener(MouseEvent.CLICK,this.onClick);
            }
            _loc2_++;
         }
      }
      
      private function onMouseTip(param1:MouseEvent) : void
      {
         var _loc3_:String = null;
         var _loc2_:int = parseInt(param1.currentTarget.name);
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               if(this.zuoArr == null || this.zuoArr.length == 0)
               {
                  return;
               }
               _loc3_ = "";
               _loc3_ += "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + this.setType(_loc2_ + 1) + "</font><br>";
               _loc3_ += "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + this.zuoArr[_loc2_].lv * 2 / 10 + "%。</font><br>";
               this.showTip(_loc3_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_MOVE:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.x = Tools.currentStage.mouseX + 15;
                  this.tipCanvas.y = Tools.currentStage.mouseY + 12;
               }
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 10;
         this.tipCanvas.height = this.tip.height + 10;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      private function setType(param1:int) : String
      {
         switch(param1)
         {
            case 1:
               return "甲子：当触发五行金时，攻击属性提升";
            case 6:
               return "甲戌：当触发五行金时，防御属性提升";
            case 11:
               return "甲申：当触发五行金时，血量属性提升";
            case 2:
               return "乙丑：当触发五行木时，攻击属性提升";
            case 7:
               return "乙亥：当触发五行木时，防御属性提升";
            case 12:
               return "乙酉：当触发五行木时，血量属性提升";
            case 3:
               return "丙寅：当触发五行水时，攻击属性提升";
            case 8:
               return "丙午：当触发五行水时，防御属性提升";
            case 13:
               return "丙辰：当触发五行水时，血量属性提升";
            case 4:
               return "丁卯：当触发五行火时，攻击属性提升";
            case 9:
               return "丁未：当触发五行火时，防御属性提升";
            case 14:
               return "丁已：当触发五行火时，血量属性提升";
            case 5:
               return "戊辰：当触发五行土时，攻击属性提升";
            case 10:
               return "戊子：当触发五行土时，防御属性提升";
            case 15:
               return "戊申：当触发五行土时，血量属性提升";
            default:
               return " ";
         }
      }
   }
}

