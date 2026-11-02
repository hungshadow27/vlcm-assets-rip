package com.tgame.manager
{
   import com.tgame.common.staticdata.BangzhongZhiwu;
   import com.tgame.common.staticdata.ItemMenuStatus;
   import com.tgame.common.staticdata.MountQuality;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.staticdata.TaskActionType;
   import com.tgame.common.staticdata.TaskPublishType;
   import com.tgame.common.staticdata.TaskType;
   import com.tgame.common.staticdata.TopTenTitle;
   import com.tgame.common.vo.item.ItemTip;
   import com.tgame.common.vo.item.MallGoods;
   import com.tgame.shell.view.components.NPCShopPanel;
   
   public class StaticValueManager
   {
      
      public function StaticValueManager()
      {
         super();
      }
      
      public static function init() : void
      {
         ItemTip.init();
         NPCShopPanel.init();
         BangzhongZhiwu.init();
         ItemMenuStatus.init();
         MountQuality.init();
         NpcFunctionType.init();
         PartyType.init();
         TaskActionType.init();
         TaskPublishType.init();
         TaskType.init();
         TopTenTitle.init();
         MallGoods.init();
      }
   }
}

