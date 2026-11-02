package com.tgame.shell.view.components.peiyangdianfengshou
{
   import com.asQuery.$;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.skin.PeiYangDianFengShouSkin;
   import game.utils.SkinTools;
   
   public class YNPeiyangdianfengshouPanel extends BasePanel
   {
      
      public static const PEIYANGDIANFENGSHOU_WEIYANG:String = "PEIYANGDIANFENGSHOU_WEIYANG";
      
      public static const PEIYANGDIANFENGSHOU_LINGQUJIANGLI:String = "PEIYANGDIANFENGSHOU_LINGQUJIANGLI";
      
      private var boo:int;
      
      public function YNPeiyangdianfengshouPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(PeiYangDianFengShouSkin.skin,"peiyangdianfengshou");
         this.init();
      }
      
      private function init() : void
      {
         $("weiyang1 weiyang2 weiyang3 weiyang4 weiyang5 weiyang6 lingqu1 lingqu2 lingqu3 lingqu4 lingqu5 lingqu6",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
         $("wenben1",this,true).attr("text",LanResManager.getLanCommonTextWords("培养巅峰兽活动时间")).attr("y",$("wenben1",this,true).getAttr("y") - 3);
         $("wenben2",this,true).attr("text",LanResManager.getLanCommonTextWords("培养巅峰兽喂养时间")).attr("y",$("wenben2",this,true).getAttr("y") - 3);
         $("wenben3",this,true).attr("text",LanResManager.getLanCommonTextWords("培养巅峰兽领奖时间")).attr("y",$("wenben3",this,true).getAttr("y") - 3);
         $("duigou1",this,true).attr("selected",false);
         $("wenben4",this,true).attr("visible",false);
         $("duigou1",this,true).attr("visible",false);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         if($("duigou1",this,true).getAttr("selected"))
         {
            this.boo = 1;
         }
         else
         {
            this.boo = 0;
         }
         switch(param1.target.name)
         {
            case "weiyang1":
               dispatchEvent(new BaseEvent(PEIYANGDIANFENGSHOU_WEIYANG,"",[1,this.boo]));
               break;
            case "weiyang2":
               dispatchEvent(new BaseEvent(PEIYANGDIANFENGSHOU_WEIYANG,"",[2,this.boo]));
               break;
            case "weiyang3":
               dispatchEvent(new BaseEvent(PEIYANGDIANFENGSHOU_WEIYANG,"",[3,this.boo]));
               break;
            case "weiyang4":
               dispatchEvent(new BaseEvent(PEIYANGDIANFENGSHOU_WEIYANG,"",[4,this.boo]));
               break;
            case "weiyang5":
               dispatchEvent(new BaseEvent(PEIYANGDIANFENGSHOU_WEIYANG,"",[5,this.boo]));
               break;
            case "weiyang6":
               dispatchEvent(new BaseEvent(PEIYANGDIANFENGSHOU_WEIYANG,"",[6,this.boo]));
               break;
            case "lingqu1":
               dispatchEvent(new BaseEvent(PEIYANGDIANFENGSHOU_LINGQUJIANGLI,"",1));
               break;
            case "lingqu2":
               dispatchEvent(new BaseEvent(PEIYANGDIANFENGSHOU_LINGQUJIANGLI,"",2));
               break;
            case "lingqu3":
               dispatchEvent(new BaseEvent(PEIYANGDIANFENGSHOU_LINGQUJIANGLI,"",3));
               break;
            case "lingqu4":
               dispatchEvent(new BaseEvent(PEIYANGDIANFENGSHOU_LINGQUJIANGLI,"",4));
               break;
            case "lingqu5":
               dispatchEvent(new BaseEvent(PEIYANGDIANFENGSHOU_LINGQUJIANGLI,"",5));
               break;
            case "lingqu6":
               dispatchEvent(new BaseEvent(PEIYANGDIANFENGSHOU_LINGQUJIANGLI,"",6));
         }
      }
      
      public function setData(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            $("shuzhiwenben" + (_loc2_ + 1),this,true).attr("text",param1[_loc2_]);
            _loc2_++;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

