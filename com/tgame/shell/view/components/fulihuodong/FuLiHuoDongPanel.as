package com.tgame.shell.view.components.fulihuodong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Sprite;
   
   public class FuLiHuoDongPanel extends FPanel
   {
      
      private var boxContainer:Sprite;
      
      private var txtArr:Array;
      
      private var Scroll:FVScorllBar;
      
      public function FuLiHuoDongPanel()
      {
         var _loc1_:FTextArea = null;
         super();
         this.titleText = "福利活动";
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 633;
         height = 560;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.boxContainer = new Sprite();
         this.boxContainer.x = 20;
         this.boxContainer.y = 12;
         addChild(this.boxContainer);
         _loc1_ = new FTextArea();
         _loc1_.textColor = StaticValue.GOLD;
         _loc1_.filters = StaticValue.filter;
         _loc1_.width = 605;
         _loc1_.height = 1000;
         var _loc2_:String = "";
         _loc2_ += "<textformat leading=\'6\'>";
         _loc2_ += "<font color=\'StaticValue.GOLD_HTML\'>" + "活动时间：7月15日至7月31日" + "<br>" + "平台庆典期间，每天累计充值满100元可申请：100档专属包（每日限一次）" + "<br>" + "平台庆典期间，每天累计充值满200元可申请：200档专属包（每日限一次）" + "<br>" + "平台庆典期间，每天累计充值满500元可申请：500档专属包（每日限一次）" + "<br>" + "平台庆典期间，每累计充值满500元可申请金子x20000 兑换 1000属性包（限20次）。" + "<br>" + "平台庆典期间，累计充值满1000元可申请：超级锻造材料x3000（不限时） + 罗云阵（限" + "<br>" + "1次）" + "<br>" + "平台庆典期间，累计充值满3000元可申请：白焰豹（限1次）" + "<br>" + "平台庆典期间，累计充值满5000元可申请：神龙护身符（满层）（限1次）" + "<br>" + "平台庆典期间，累计充值满10000元可申请：干将莫邪幸运丹（限1次）" + "<br>" + "罗云阵" + "<br>" + "特殊属性：攻击：38888 防御：28888 生命：48888  武功：1层" + "<br>" + "白焰豹（神骑）" + "<br>" + "特殊属性：攻击：68888  防御：58888  生命：68888 武功：3层" + "<br>" + "神龙护身符（满层）" + "<br>" + "特殊属性：攻击：38888 防御：28888 生命：48888  武功：1层" + "<br>" + "隐隐有龙吟之声的终极护身符，可威慑心魂。所有已学武功层数+25（同时可以进行洗炼，" + "<br>" + "最高所有武功加成可至+25）" + "<br>" + "100档专属包：内含青铜福利包、白银福利包" + "<br>" + "200档专属包：内含青铜福利包、白银福利包、黄金福利包" + "<br>" + "500档专属包：内含青铜福利包、白银福利包、黄金福利包、白金福利包" + "<br>" + "1000属性包：双击可获得1000潜能点" + "<br>" + "青铜福利包：内含：2000金子 + 榛子x10 + 玄黄石x10 + 金锭x5" + "<br>" + "白银福利包：内含：3000金子 + 榛子x20 + 玄黄石x20 + 金锭x10" + "<br>" + "黄金福利包：内含：5000金子 + 榛子x50 + 玄黄石x50 + 金锭x20" + "<br>" + "白金福利包：内含：10000金子 + 榛子x100 + 玄黄石x100 + 金锭x50" + "<br>" + "" + "<br>" + "活动二：璀璨特权" + "<br>" + "当天充值3000元可申请璀璨特权" + "<br>" + "特权期间，每充值500元除原本返利外可额外都申请时装碎片x1+超级锻造材料x500（不限" + "<br>" + "时）" + "<br>" + "特权期间，每充值1000元除原本返利外可额外都申请神器碎片x1+超级锻造材料x1000（不" + "<br>" + "限时）" + "<br>" + "平台庆典期间，集齐满神器碎片x10可申请天葬（转世）" + "<br>" + "平台庆典期间，集齐满时装碎片x10可申请罗凌" + "<br>" + "璀璨特权介绍：" + "<br>" + "1.\t璀璨特权持续到7月31号结束" + "<br>" + "2.\t每天充值累计满500、1000将获得额外奖励" + "<br>" + "3.\t璀璨特权专属包" + "<br>" + "璀璨500专属包：内含：时装碎片x1+超级锻造材料x500（不限时）" + "<br>" + "璀璨1000专属包：内含神器碎片x1+超级锻造材料x1000（不限时）" + "<br>" + "璀璨特权专属包：时装碎片x3 + 神器碎片x3 + 鬼剑（神器）" + "<br>" + "天葬（转世）" + "<br>" + "特殊属性：攻击：100000  防御：50000  生命：200000" + "<br>" + "特殊技能：【天道】攻击时有几率触发满血效果" + "<br>" + "【天葬】攻击时有5%几率使对手的坐骑化为星尘" + "<br>" + "鬼剑（神器）" + "<br>" + "特殊属性：攻击：100000  防御：50000  生命：100000" + "<br>" + "罗凌" + "<br>" + "特殊属性：攻击：88888  防御：78888 生命：100000" + "<br>" + "特殊效果：被攻击8次后触发，期间提升自身防御20%。持续10秒" + "<br>";
         _loc2_ += "</textformat>";
         _loc1_.htmlText = _loc2_;
         this.boxContainer.addChild(_loc1_);
         this.Scroll = new FVScorllBar(this.boxContainer,495);
         addChild(this.Scroll);
         this.Scroll.x = 603;
         this.Scroll.y = 15;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

