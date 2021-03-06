{extends file=$layout}

{block name='head_seo' prepend}
<link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
<meta property="og:type" content="product">
<meta property="og:url" content="{$urls.current_url}">
<meta property="og:title" content="{$page.meta.title}">
<meta property="og:site_name" content="{$shop.name}">
<meta property="og:description" content="{$page.meta.description}">
<meta property="og:image" content="{$product.cover.large.url}">
<meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
<meta property="product:pretax_price:currency" content="{$currency.iso_code}">
<meta property="product:price:amount" content="{$product.price_amount}">
<meta property="product:price:currency" content="{$currency.iso_code}">
{if isset($product.weight) && ($product.weight != 0)}
<meta property="product:weight:value" content="{$product.weight}">
<meta property="product:weight:units" content="{$product.weight_unit}">
{/if}
{/block}

{block name='content'}

<section id="main" itemscope itemtype="https://schema.org/Product">
  <meta itemprop="url" content="{$product.url}">
  <div class="col-md-13 description-disabled-1">
    <div class="short_description">{l s='Short description' d='Admin.Catalog.Feature'}</div>
    {block name='product_description_short'}
    <div id="product-description-short-{$product.id}" itemprop="description">{$product.description_short nofilter}</div>
    {/block}
    {block name='product_comment'}
    {capture name='displayDdProductExtra'}{hook h='displayDdProductExtra'}{/capture}
    {if $smarty.capture.displayDdProductExtra}{$smarty.capture.displayDdProductExtra nofilter}{/if}
    {/block}
    {hook h='displayReassurance'}
  </div>
  <div class="row">
    <div class="col-md-14">
      {block name='page_header_container'}

      {block name='page_header'}
      <h1 class="h1 product" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1>
      {/block}
      {/block}
      {block name='page_content_container'}
      <section class="page-content" id="content">
        {block name='page_content'}

        {block name='product_cover_tumbnails'}
        {include file='catalog/_partials/product-cover-thumbnails.tpl'}
        {/block}
        <div class="scroll-box-arrows">
          <i class="material-icons left">&#xE314;</i>
          <i class="material-icons right">&#xE315;</i>
        </div>

        {/block}
      </section>
      {/block}
    </div>

    <div class="col-md-13 description-disabled-2">
      <div class="short_description">{l s='Short description' d='Admin.Catalog.Feature'}</div>
      {block name='product_description_short'}
      <div id="product-description-short-{$product.id}" class="description" itemprop="description">{$product.description_short nofilter}</div>
      {/block}
      {block name='product_comment'}
      {capture name='displayDdProductExtra'}{hook h='displayDdProductExtra'}{/capture}
      {if $smarty.capture.displayDdProductExtra}{$smarty.capture.displayDdProductExtra nofilter}{/if}
      {/block}
      {hook h='displayReassurance'}
    </div>
    <div class="col-md-13">
      <div class="product-information">	
        {block name='product_prices'}
        {include file='catalog/_partials/product-prices.tpl'}
        {/block}

        {if $product.is_customizable && count($product.customizations.fields)}
        {block name='product_customization'}
        {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
        {/block}
        {/if}

        <div class="product-actions">
          {block name='product_buy'}
          <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
            <input type="hidden" name="token" value="{$static_token}">
            <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
            <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

            {block name='product_variants'}
            {include file='catalog/_partials/product-variants.tpl'}
            {/block}

            {block name='product_pack'}
            {if $packItems}
            <section class="product-pack">
              <h3 class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</h3>
              {foreach from=$packItems item="product_pack"}
              {block name='product_miniature'}
              {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
              {/block}
              {/foreach}
            </section>
            {/if}
            {/block}

            {block name='product_discounts'}
            {include file='catalog/_partials/product-discounts.tpl'}
            {/block}

            {block name='product_add_to_cart'}
            {include file='catalog/_partials/product-add-to-cart.tpl'}
            {/block}

            {hook h='displayProductButtons' product=$product}

            {block name='product_refresh'}
            <input class="product-refresh ps-hidden-by-js" name="refresh" type="submit" value="{l s='Refresh' d='Shop.Theme.Actions'}">
            {/block}
          </form>
          {/block}

        </div>

      </div>
    </div>
  </div>

  <div class="tabs">
    <ul class="nav nav-tabs">
      {if $product.description}
      <li class="nav-item">
        <a class="nav-link{if $product.description} active{/if}" data-toggle="tab" href="#description">{l s='Description' d='Shop.Theme.Catalog'}</a>
      </li>
      {/if}
      <!--
      <li class="nav-item">
        <a class="nav-link{if !$product.description} active{/if}" data-toggle="tab" href="#product-details">{l s='Product Details' d='Shop.Theme.Catalog'}</a>
      </li>
      -->
      {if $product.attachments}
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#attachments">{l s='Attachments' d='Shop.Theme.Catalog'}</a>
      </li>
      {/if}
      {foreach from=$product.extraContent item=extra key=extraKey}
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#extra-{$extraKey}">{$extra.title}</a>
      </li>
      {/foreach}

      {block name='product_comment_tab'}
      {capture name='displayDdProductTab'}{hook h='displayDdProductTab'}{/capture}
      {if $smarty.capture.displayDdProductTab}{$smarty.capture.displayDdProductTab nofilter}{/if}
      {/block}

    </ul>

    <div class="tab-content" id="tab-content">
      <div class="tab-pane fade in{if $product.description} active{/if}" id="description">
        {block name='product_description'}
        <div class="product-description">
          {if isset($product.reference_to_display)}
          <div class="product-reference">
            <label class="descripcion_referencia_titulo">{l s='Reference' d='Shop.Theme.Catalog'} </label>
            <span itemprop="sku" class="descripcion_referencia_valor">{$product.reference_to_display}</span>
          </div>
          {/if}
          {$product.description nofilter}
        </div>
        {/block}
      </div>

      {block name='product_details'}
      {include file='catalog/_partials/product-details.tpl'}
      {/block}
      {block name='product_attachments'}
      {if $product.attachments}
      <div class="tab-pane fade in" id="attachments">
        <section class="product-attachments">
          <h3 class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</h3>
          {foreach from=$product.attachments item=attachment}
          <div class="attachment">
            <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
            <p>{$attachment.description}</p>
              <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
              </a>
            </div>
            {/foreach}
          </section>
        </div>
        {/if}
        {/block}
        {foreach from=$product.extraContent item=extra key=extraKey}
        <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
          {$extra.content nofilter}
        </div>
        {/foreach}
        {block name='product_comment_tab_content'}
        {capture name='displayDdProductTabContent'}{hook h='displayDdProductTabContent'}{/capture}
        {if $smarty.capture.displayDdProductTabContent}{$smarty.capture.displayDdProductTabContent nofilter}{/if}
        {/block}
      </div>		
      <div class="clearfix"></div>
      {block name='product_accessories'}
      {if $accessories}
      <section class="featured-products clearfix">
        <div class="linia_tytul">
          <div class="tytuly">
          {l s='You might also like' d='Shop.Theme.Catalog'}</div>
          <div class="SliderNavigation">
            <a class="btn prev slideraccessory_prev">&nbsp;</a>
            <a class="btn next slideraccessory_next">&nbsp;</a>
          </div>
        </div>				
        <div class="products">
          {assign var='sliderFor' value=2}
          {assign var='productCount' value=count($accessories)}

          {if $productCount >= $sliderFor}
          <ul id="accessory-carousel" class="product_list">
            {else}
            <ul id="accessory-grid" class="productscategory_grid product_list grid row gridcount">
              {/if}
              {foreach from=$accessories item="product_accessory"}
              <li class="{if $productCount >= $sliderFor}item{else}product_item col-xs-12 col-sm-6 col-md-4 col-lg-3{/if}">
                {include file="catalog/_partials/miniatures/product.tpl" product=$product_accessory}
              </li>
              {/foreach}
            </ul>
          </div>
        </section>
        {/if}
        {/block}

        {block name='product_footer'}
        {hook h='displayFooterProduct' product=$product category=$category}
        {/block}

        {block name='product_images_modal'}
        {include file='catalog/_partials/product-images-modal.tpl'}
        {/block}

        {block name='page_footer_container'}
        <footer class="page-footer">
          {block name='page_footer'}
          <!-- Footer content -->
          {/block}
        </footer>
        {/block}
      </section>

      {/block}


