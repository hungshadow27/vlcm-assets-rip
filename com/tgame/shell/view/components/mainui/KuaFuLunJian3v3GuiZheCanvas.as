package com.tgame.shell.view.components.mainui
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class KuaFuLunJian3v3GuiZheCanvas extends Sprite
   {
      
      private var btn:FSimpleButton;
      
      private var canvas:FCanvas;
      
      private var ftext:FTextArea;
      
      private var queryBtn:SecondButton;
      
      public function KuaFuLunJian3v3GuiZheCanvas()
      {
         super();
         this.canvas = new FCanvas();
         this.canvas.skin = "menuBg";
         addChildAt(this.canvas,0);
         this.canvas.width = 310;
         this.btn = new FSimpleButton();
         this.btn.skin = "subButton";
         addChild(this.btn);
         this.btn.x = this.canvas.width - this.btn.width - 5;
         this.btn.y = this.canvas.y + 5;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.ftext = new FTextArea();
         this.ftext.autoSize = TextFieldAutoSize.LEFT;
         this.ftext.textColor = StaticValue.WHITE;
         this.ftext.filters = StaticValue.filter;
         this.ftext.x = 5;
         this.ftext.y = 15;
         this.canvas.addChild(this.ftext);
         this.queryBtn = new SecondButton();
         this.queryBtn.label = LanResManager.getLanCommonTextWords("打开跨服包裹");
         this.canvas.addChild(this.queryBtn);
         this.queryBtn.x = this.canvas.width / 2 - this.queryBtn.width / 2;
         this.queryBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               if(this.btn.skin == "subButton")
               {
                  this.btn.skin = "sumButton";
                  this.btn.x = 5;
                  this.btn.y = 0;
                  this.canvas.visible = false;
               }
               else
               {
                  this.btn.skin = "subButton";
                  this.btn.x = this.canvas.width - this.btn.width - 5;
                  this.btn.y = this.canvas.y + 5;
                  this.canvas.visible = true;
               }
               break;
            case this.queryBtn:
               parent.dispatchEvent(new BaseEvent(MainUI.MAINUI_KUAFU_GUIZHE_QUERY,"",3));
         }
      }
      
      public function setValue(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:Array, param7:int, param8:int, param9:int) : void
      {
         var _loc13_:int = 0;
         var _loc10_:Function = LanResManager.getLanCommonTextWords;
         var _loc11_:Function = LanResManager.getLanTextWords;
         var _loc12_:String = "";
         _loc12_ = _loc12_ + ("<font color=\'" + StaticValue.YELLOW_HTML + "\'>");
         _loc12_ = _loc12_ + _loc11_(this,"黄队占旗",[param1,param2]);
         _loc13_ = 0;
         while(_loc13_ < param3.length)
         {
            if(param3[_loc13_][4] == 0)
            {
               _loc12_ += "<br />  <font color=\'#5c5c5c\'>" + param3[_loc13_][0] + "  " + _loc10_("胜：") + param3[_loc13_][1] + "  " + _loc10_("败：") + param3[_loc13_][2] + "  " + _loc10_("占：") + param3[_loc13_][3] + "</font>";
            }
            else
            {
               _loc12_ += "<br />  " + param3[_loc13_][0] + "  " + _loc10_("胜：") + param3[_loc13_][1] + "  " + _loc10_("败：") + param3[_loc13_][2] + "  " + _loc10_("占：") + param3[_loc13_][3];
            }
            _loc13_++;
         }
         _loc12_ += "</font>";
         _loc12_ = _loc12_ + ("<font color=\'" + StaticValue.BLUE_HTML + "\'>");
         _loc12_ = _loc12_ + ("<br />" + _loc11_(this,"蓝队占旗",[param4,param5]));
         _loc13_ = 0;
         while(_loc13_ < param6.length)
         {
            if(param6[_loc13_][4] == 0)
            {
               _loc12_ += "<br />  <font color=\'#5c5c5c\'>" + param6[_loc13_][0] + "  " + _loc10_("胜：") + param6[_loc13_][1] + "  " + _loc10_("败：") + param6[_loc13_][2] + "  " + _loc10_("占：") + param6[_loc13_][3] + "</font>";
            }
            else
            {
               _loc12_ += "<br />  " + param6[_loc13_][0] + "  " + _loc10_("胜：") + param6[_loc13_][1] + "  " + _loc10_("败：") + param6[_loc13_][2] + "  " + _loc10_("占：") + param6[_loc13_][3];
            }
            _loc13_++;
         }
         _loc12_ += "</font>";
         var _loc14_:int = Math.floor(param7 / 60);
         var _loc15_:int = param7 % 60;
         _loc12_ += "<font color=\'" + StaticValue.RED_HTML + "\'>";
         _loc12_ = _loc12_ + ("<br />" + _loc11_(this,"竞技场剩余时间倒计时",[_loc14_,_loc15_]));
         _loc12_ = _loc12_ + "</font>";
         _loc12_ = _loc12_ + ("<font color=\'" + StaticValue.GREEN_HTML + "\'>");
         _loc12_ = _loc12_ + ("<br />" + _loc10_("剩余时间结束时占旗数高的一方胜出获得胜利奖"));
         _loc12_ = _loc12_ + ("<br />" + _loc10_("占旗数低的一方获得安慰奖；战平则双方均获安慰奖"));
         _loc12_ = _loc12_ + "</font>";
         _loc12_ = _loc12_ + ("<font color=\'" + StaticValue.PURPLE_HTML + "\'>");
         _loc12_ = _loc12_ + ("<br />" + _loc10_("分出胜负前强制退出者未来1小时内将无法再次进场"));
         _loc12_ = _loc12_ + ("<br />" + _loc11_(this,"在竞技场中您将每分钟获得经验",[param8,param9]));
         _loc12_ = _loc12_ + "</font>";
         this.ftext.htmlText = _loc12_;
         this.canvas.height = this.ftext.height + 27 + this.queryBtn.height;
         this.queryBtn.y = this.ftext.y + this.ftext.height + 10;
      }
      
      public function setValue_PK(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:Array, param7:int, param8:int, param9:int) : void
      {
         var _loc13_:int = 0;
         var _loc10_:Function = LanResManager.getLanCommonTextWords;
         var _loc11_:Function = LanResManager.getLanTextWords;
         var _loc12_:String = "";
         _loc12_ = _loc12_ + ("<font color=\'" + StaticValue.YELLOW_HTML + "\'>");
         _loc12_ = _loc12_ + _loc11_(this,"黄队杀人",[param1,param2]);
         _loc13_ = 0;
         while(_loc13_ < param3.length)
         {
            if(param3[_loc13_][4] == 0)
            {
               _loc12_ += "<br />  <font color=\'#5c5c5c\'>" + param3[_loc13_][0] + "  " + _loc10_("胜：") + param3[_loc13_][1] + "  " + _loc10_("败：") + param3[_loc13_][2] + "</font>";
            }
            else
            {
               _loc12_ += "<br />  " + param3[_loc13_][0] + "  " + _loc10_("胜：") + param3[_loc13_][1] + "  " + _loc10_("败：") + param3[_loc13_][2];
            }
            _loc13_++;
         }
         _loc12_ += "</font>";
         _loc12_ = _loc12_ + ("<font color=\'" + StaticValue.BLUE_HTML + "\'>");
         _loc12_ = _loc12_ + ("<br />" + _loc11_(this,"蓝队杀人",[param4,param5]));
         _loc13_ = 0;
         while(_loc13_ < param6.length)
         {
            if(param6[_loc13_][4] == 0)
            {
               _loc12_ += "<br />  <font color=\'#5c5c5c\'>" + param6[_loc13_][0] + "  " + _loc10_("胜：") + param6[_loc13_][1] + "  " + _loc10_("败：") + param6[_loc13_][2] + "</font>";
            }
            else
            {
               _loc12_ += "<br />  " + param6[_loc13_][0] + "  " + _loc10_("胜：") + param6[_loc13_][1] + "  " + _loc10_("败：") + param6[_loc13_][2];
            }
            _loc13_++;
         }
         _loc12_ += "</font>";
         var _loc14_:int = Math.floor(param7 / 60);
         var _loc15_:int = param7 % 60;
         _loc12_ += "<font color=\'" + StaticValue.RED_HTML + "\'>";
         _loc12_ = _loc12_ + ("<br />" + _loc11_(this,"竞技场剩余时间倒计时",[_loc14_,_loc15_]));
         _loc12_ = _loc12_ + "</font>";
         _loc12_ = _loc12_ + ("<font color=\'" + StaticValue.GREEN_HTML + "\'>");
         _loc12_ = _loc12_ + ("<br />" + _loc10_("剩余时间结束时击败对手数高的一方胜出获得胜利奖"));
         _loc12_ = _loc12_ + ("<br />" + _loc10_("击败对手数低的一方获得安慰奖；战平则双方均获安慰奖"));
         _loc12_ = _loc12_ + "</font>";
         _loc12_ = _loc12_ + ("<font color=\'" + StaticValue.PURPLE_HTML + "\'>");
         _loc12_ = _loc12_ + ("<br />" + _loc10_("分出胜负前强制退出者未来1小时内将无法再次进场"));
         _loc12_ = _loc12_ + ("<br />" + _loc11_(this,"在竞技场中您将每分钟获得经验",[param8,param9]));
         _loc12_ = _loc12_ + "</font>";
         this.ftext.htmlText = _loc12_;
         this.canvas.height = this.ftext.height + 27 + this.queryBtn.height;
         this.queryBtn.y = this.ftext.y + this.ftext.height + 10;
      }
   }
}

