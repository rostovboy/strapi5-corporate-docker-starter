import type { Schema, Struct } from '@strapi/strapi';

export interface SharedSeoData extends Struct.ComponentSchema {
  collectionName: 'components_shared_seo_data';
  info: {
    displayName: 'SeoData';
    icon: 'chartCircle';
  };
  attributes: {
    canonicalURL: Schema.Attribute.String;
    keywords: Schema.Attribute.Text;
    metaDescription: Schema.Attribute.Text;
    metaImage: Schema.Attribute.Media<'images'>;
    metaRobots: Schema.Attribute.String;
    metaTitle: Schema.Attribute.String;
    metaViewport: Schema.Attribute.String;
    structuredData: Schema.Attribute.JSON;
  };
}

declare module '@strapi/strapi' {
  export module Public {
    export interface ComponentSchemas {
      'shared.seo-data': SharedSeoData;
    }
  }
}
