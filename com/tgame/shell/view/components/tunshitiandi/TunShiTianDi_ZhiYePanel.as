package com.tgame.shell.view.components.tunshitiandi
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.moudels.tunShiTianDi.view.info.ShuXingJiaChen;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class TunShiTianDi_ZhiYePanel extends FPanel
   {
      
      public var _$parent:DisplayObject;
      
      private var quedingBtn:SecondButton;
      
      private var tfalign:TextFormat;
      
      private var bg:DisplayObject;
      
      private var jieshao:FTextArea;
      
      private var addFta:FTextArea;
      
      public var zhiyeSpr:Sprite;
      
      private var index:int = 1;
      
      private var xuanzhongbg:DisplayObject;
      
      public function TunShiTianDi_ZhiYePanel()
      {
         var ft:FTextArea = null;
         super();
         titleText = LanResManager.getLanCommonTextWords("吞食天地");
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 685 - 130;
         height = 463 - 5;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/zhiyebg.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.tfalign = new TextFormat();
         this.tfalign.align = "center";
         this.quedingBtn = new SecondButton();
         addChild(this.quedingBtn);
         this.quedingBtn.x = 170 + 60;
         this.quedingBtn.y = 395 - 3;
         this.quedingBtn.label = LanResManager.getLanCommonTextWords("确定职业");
         this.quedingBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         ft = new FTextArea();
         ft.wordWrap = true;
         ft.filters = StaticValue.filter;
         ft.x = 360 + 23;
         ft.y = 25 + 3;
         ft.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("职业介绍") + "</font>";
         addChild(ft);
         this.jieshao = new FTextArea();
         this.jieshao.wordWrap = true;
         this.jieshao.filters = StaticValue.filter;
         this.jieshao.width = 170 + 28 - 10 + 5;
         this.jieshao.height = 275;
         this.jieshao.x = 325 + 22 - 4 - 28 + 4 - 5;
         this.jieshao.y = 75 + 3 - 10;
         this.jieshao.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'></font>";
         addChild(this.jieshao);
         this.addFta = new FTextArea();
         this.addFta.wordWrap = true;
         this.addFta.filters = StaticValue.filter;
         this.addFta.width = 170 + 28 - 10 + 5;
         this.addFta.height = 275;
         this.addFta.x = 325 + 22 - 4 - 28 + 4 - 5;
         this.addFta.y = 75 + 3 - 10 + 170;
         this.addFta.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'></font>";
         addChild(this.addFta);
         this.zhiyeSpr = new Sprite();
         with(this.zhiyeSpr)
         {
            x = 10 + 29 - 6;
            y = 2 + 23 + 2;
            graphics.beginFill(16777215,0);
            graphics.drawRect(0,0,254,327);
            graphics.endFill();
            doubleClickEnabled = true;
         }
         addChild(this.zhiyeSpr);
         this.zhiyeSpr.addEventListener(MouseEvent.MOUSE_UP,this.onSelect);
      }
      
      public function onClose(param1:* = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
         POPWindowManager.closeWindow();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this._$parent.dispatchEvent(new BaseEvent(TunShiTianDi_ZhenRongPanel.SHOW_TUNSHITIANDI_XUANZE_CLICK,"",this.index));
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
         POPWindowManager.closeWindow();
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         if(this.zhiyeSpr.mouseY > 0 && this.zhiyeSpr.mouseY < 155)
         {
            if(this.zhiyeSpr.mouseX > 0 && this.zhiyeSpr.mouseX < 115)
            {
               this.index = 1;
            }
            else if(this.zhiyeSpr.mouseX > 140 && this.zhiyeSpr.mouseX < 254)
            {
               this.index = 2;
            }
         }
         if(this.zhiyeSpr.mouseY > 174 && this.zhiyeSpr.mouseY < 327)
         {
            if(this.zhiyeSpr.mouseX > 0 && this.zhiyeSpr.mouseX < 115)
            {
               this.index = 3;
            }
            else if(this.zhiyeSpr.mouseX > 140 && this.zhiyeSpr.mouseX < 254)
            {
               this.index = 4;
            }
         }
         if(this.index == 0)
         {
            return;
         }
         this.shezhi(this.index);
      }
      
      public function shezhi(param1:int = 0) : void
      {
         this._$parent.dispatchEvent(new BaseEvent(TunShiTianDi_ZhenRongPanel.SHOW_TUNSHITIANDI_SHUXING_CLICK,"",param1));
         while(this.zhiyeSpr.numChildren > 0)
         {
            this.zhiyeSpr.removeChildAt(0);
         }
         this.xuanzhongbg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/tunshitiandi/xuanzhong.swf");
         this.zhiyeSpr.addChild(this.xuanzhongbg);
         if(param1 == 1)
         {
            this.xuanzhongbg.x = 0 - 2;
            this.xuanzhongbg.y = 0 - 1;
            this.jieshao.htmlText = "<font color = \'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("少林派弟子") + "<br>" + LanResManager.getLanCommonTextWords("少林派弟子属于力量型的，攻击高，血高。") + "<br>" + LanResManager.getLanCommonTextWords("普通技能：近身攻击") + "<br>" + LanResManager.getLanCommonTextWords("伏虎拳 主动：可以给敌人造成成倍伤害") + "<br>" + LanResManager.getLanCommonTextWords("般若决 主动：可以增加队友攻击力") + "<br>" + LanResManager.getLanCommonTextWords("锻骨决 被动：可以增加自身的攻击力") + "<br>" + "</font>";
         }
         else if(param1 == 2)
         {
            this.xuanzhongbg.x = 140 - 3;
            this.xuanzhongbg.y = 0 - 1;
            this.jieshao.htmlText = "<font color = \'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("全真派弟子") + "<br>" + LanResManager.getLanCommonTextWords("全真派弟子属于体质型的，攻击低，血高。") + "<br>" + LanResManager.getLanCommonTextWords("普通技能：近身攻击") + "<br>" + LanResManager.getLanCommonTextWords("仙骨脱俗 主动：可以增加队友和自身的防御力") + "<br>" + LanResManager.getLanCommonTextWords("枯木逢春 主动：可以攻击敌人，并有几率附加吸血功能") + "<br>" + LanResManager.getLanCommonTextWords("养命决 被动：可以给队友及自身增加生命上限") + "<br>" + "</font>";
         }
         else if(param1 == 3)
         {
            this.xuanzhongbg.x = 0 - 2;
            this.xuanzhongbg.y = 174 - 1;
            this.jieshao.htmlText = "<font color = \'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("古墓派弟子") + "<br>" + LanResManager.getLanCommonTextWords("古墓派弟子属于智力型角色，法高，血高，攻击低") + "<br>" + LanResManager.getLanCommonTextWords("普通技能：远程攻击") + "<br>" + LanResManager.getLanCommonTextWords("疗伤 主动：可以给队友及自身增加生命值") + "<br>" + LanResManager.getLanCommonTextWords("御敌术 主动：受到伤害将消耗自身法力，当法力为0消耗血量") + "<br>" + LanResManager.getLanCommonTextWords("天涯回首 被动：攻击时有一定几率吸收法力值") + "<br>" + "</font>";
         }
         else if(param1 == 4)
         {
            this.xuanzhongbg.x = 140 - 3;
            this.xuanzhongbg.y = 174 - 1;
            this.jieshao.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("桃花岛弟子") + "<br>" + LanResManager.getLanCommonTextWords("桃花岛弟子属于敏捷型角色，暴击高，移动速度高") + "<br>" + LanResManager.getLanCommonTextWords("普通技能：远程攻击") + "<br>" + LanResManager.getLanCommonTextWords("战神之佑 主动：规定时间内暴击提升") + "<br>" + LanResManager.getLanCommonTextWords("迅疾术 被动：给自身增加移动速度") + "<br>" + LanResManager.getLanCommonTextWords("急速术 被动：可以给队友增加攻击速度") + "<br>" + "</font>";
         }
      }
      
      public function setAddValue(param1:ShuXingJiaChen) : void
      {
         this.addFta.htmlText = "<font size=\'12\' color = \'" + StaticValue.GOLD_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击：") + param1.ap + (param1.addAp > 0 ? "+" + param1.addAp : "") + "<br>" + LanResManager.getLanCommonTextWords("防御：") + param1.dp + (param1.addDp > 0 ? "+" + param1.addDp : "") + "<br>" + LanResManager.getLanCommonTextWords("生命：") + param1.sm + (param1.addSm > 0 ? "+" + param1.addSm : "") + "<br>" + LanResManager.getLanCommonTextWords("闪避：") + param1.ev + (param1.addEv > 0 ? "+" + param1.addEv : "") + "<br>" + LanResManager.getLanCommonTextWords("暴击：") + param1.cp + (param1.addCp > 0 ? "+" + param1.addCp : "") + "<br>" + LanResManager.getLanCommonTextWords("攻击速度：") + param1.adx + (param1.addAdx > 0 ? "+" + param1.addAdx : "") + "<br>" + LanResManager.getLanCommonTextWords("移动速度：") + param1.mdx + (param1.addMdx > 0 ? "+" + param1.addMdx : "") + "<br>" + "</font>";
      }
   }
}

