package com.tgame.common.ui.componets
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import flash.display.Bitmap;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class DreamBar extends Sprite
   {
      
      private var w:int = 100;
      
      private var h:int = 15;
      
      private var percentage:int = 1;
      
      private var qualityPercentage:int;
      
      private var savvyPercentage:int;
      
      private var potentialPercentage:int;
      
      private var skillPercentage:int;
      
      private var menghuanShendanJihuo:Boolean = false;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var _mask:Shape;
      
      private var chaojizuoqiQianNengDan:int = 0;
      
      private var zhongjizuoqiQianNengDan:int = 0;
      
      private var shoushenDan:int = 0;
      
      private var dianfengqiannengDan:int = 0;
      
      private var anju:int = 0;
      
      private var jiangsheng:int = 0;
      
      private var jiaodeng:int = 0;
      
      private var tieti:int = 0;
      
      public function DreamBar()
      {
         var img:Bitmap;
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this._mask = new Shape();
         addChild(this._mask);
         this._mask.x = 3;
         this._mask.y = 2;
         img = StaticValue.getBitmapByClassName("ui.ride.dreamBar.bg");
         addChild(img);
         img = StaticValue.getBitmapByClassName("ui.ride.dreamBar");
         addChild(img);
         img.x = 3;
         img.y = 2;
         img.mask = this._mask;
         this.reDraw();
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
      }
      
      private function reDraw() : void
      {
         with(this._mask.graphics)
         {
            clear();
            beginFill(0);
            drawRect(0,0,66 * percentage / 100,7);
            endFill();
         }
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               _loc2_ = "";
               _loc2_ = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("总梦幻度越高，则坐骑为您加成的额外附加属性就会越高，最大可翻倍加成") + "</font><br>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("总梦幻度：") + this.percentage + "%<br>" + "　　" + LanResManager.getLanCommonTextWords("总梦幻度") + "= " + LanResManager.getLanCommonTextWords("悟性梦幻度") + "+" + LanResManager.getLanCommonTextWords("四项潜力梦幻度") + "+" + LanResManager.getLanCommonTextWords("技能梦幻度") + "+" + LanResManager.getLanCommonTextWords("本坐骑使用梦幻丹颗数") + "*1%</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("坐骑悟性梦幻度：") + this.savvyPercentage + "%<br>" + "　　( " + LanResManager.getLanCommonTextWords("当前悟性") + " / " + LanResManager.getLanCommonTextWords("悟性最大值") + " ) / 10 * 100%</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("四项潜力梦幻度：") + this.potentialPercentage + "%<br>" + "　　( " + LanResManager
               .getLanCommonTextWords("四项潜力当前值之和") + " / " + LanResManager.getLanCommonTextWords("四项潜力最大值之和") + " ) / 3* 100%</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("坐骑技能梦幻度：") + this.skillPercentage + "%<br>" + "　　( " + LanResManager.getLanCommonTextWords("当前技能数量") + " / " + LanResManager.getLanCommonTextWords("最大技能数量") + " ) / 10 *100%</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("梦幻丹追加比例：") + this.qualityPercentage + "%<br>" + "　　" + LanResManager.getLanCommonTextWords("本坐骑使用梦幻丹颗数：") + this.qualityPercentage + "</font><br>";
               if(this.menghuanShendanJihuo)
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("梦幻神丹已激活") + "<br>" + "　　" + LanResManager.getLanCommonTextWords("攻击:+") + this.percentage * 500 + "   " + LanResManager.getLanCommonTextWords("防御:+") + this.percentage * 500 + "   " + LanResManager.getLanCommonTextWords("血量上限:+") + this.percentage * 1000 + "</font><br>";
               }
               else
               {
                  _loc2_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("梦幻神丹未激活") + "<br>" + "　　" + LanResManager.getLanCommonTextWords("攻击:+") + "0   " + LanResManager.getLanCommonTextWords("防御:+") + "0   " + LanResManager.getLanCommonTextWords("血量上限:+") + "0</font><br>";
               }
               if(this.chaojizuoqiQianNengDan > 0)
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("已吃") + this.chaojizuoqiQianNengDan + LanResManager.getLanCommonTextWords("颗超级坐骑潜能丹") + "<br>" + "    " + LanResManager.getLanCommonTextWords("额外增加") + this.chaojizuoqiQianNengDan * 1000 + LanResManager.getLanCommonTextWords("点坐骑身价值") + "<br>" + "　　" + LanResManager.getLanCommonTextWords("攻击:+") + this.chaojizuoqiQianNengDan * 10000 + "   " + LanResManager.getLanCommonTextWords("血量上限:+") + this.chaojizuoqiQianNengDan * 10000 + "</font><br>";
               }
               if(this.zhongjizuoqiQianNengDan > 0)
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("已吃") + this.zhongjizuoqiQianNengDan + LanResManager.getLanCommonTextWords("颗终级坐骑潜能丹") + "<br>" + "    " + LanResManager.getLanCommonTextWords("额外增加") + this.zhongjizuoqiQianNengDan * 100000 + LanResManager.getLanCommonTextWords("点坐骑身价值") + "<br>" + "　　" + LanResManager.getLanCommonTextWords("攻击:+") + this.zhongjizuoqiQianNengDan * 1000000 + "   " + LanResManager.getLanCommonTextWords("血量上限:+") + this.zhongjizuoqiQianNengDan * 1000000 + "</font><br>";
               }
               if(this.shoushenDan > 0)
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("已吃") + this.shoushenDan + LanResManager.getLanCommonTextWords("兽神丹") + "<br>" + "　　" + LanResManager.getLanCommonTextWords("攻击:+") + this.shoushenDan * 1500 + LanResManager.getLanCommonTextWords("亿") + "   " + LanResManager.getLanCommonTextWords("武功层数:+") + this.shoushenDan * 7500 + "   " + LanResManager.getLanCommonTextWords("战斗力:+") + this.shoushenDan * 1500 + LanResManager.getLanCommonTextWords("万") + "</font><br>";
               }
               if(this.dianfengqiannengDan > 0)
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("已吃") + this.dianfengqiannengDan + LanResManager.getLanCommonTextWords("巅峰潜能丹") + "<br>" + "　　" + LanResManager.getLanCommonTextWords("攻击:+") + this.dianfengqiannengDan * 10 + LanResManager.getLanCommonTextWords("亿") + "   " + LanResManager.getLanCommonTextWords("血量:+") + this.dianfengqiannengDan * 20 + LanResManager.getLanCommonTextWords("亿   ") + LanResManager.getLanCommonTextWords("坐骑身价:+") + this.dianfengqiannengDan * 1000 + LanResManager.getLanCommonTextWords("点") + "</font><br>";
               }
               _loc2_ += "</textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      public function setValue(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:int, param8:int, param9:int, param10:int) : void
      {
         this.percentage = param1;
         this.qualityPercentage = param2;
         this.savvyPercentage = param3;
         this.potentialPercentage = param4;
         this.skillPercentage = param5;
         this.menghuanShendanJihuo = param6;
         this.chaojizuoqiQianNengDan = param7;
         this.shoushenDan = param8;
         this.zhongjizuoqiQianNengDan = param9;
         this.dianfengqiannengDan = param10;
         this.reDraw();
      }
      
      public function setHeianGuangming(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.anju = param1;
         this.jiangsheng = param2;
         this.jiaodeng = param3;
         this.tieti = param4;
      }
   }
}

