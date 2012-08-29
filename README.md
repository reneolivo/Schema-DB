Schema-DB
=========

Schema-DB aims to be a database representation of the HTML5 Schema standard.

For more information about schemas and what they aim to accomplish visit: [Schema.org] (http://schema.org)

The .MWB file attached serves as a model/diagram view of what is to be accomplished, but it's not the up to date database file. Refer to the .SQL for the actual implementation.

----------

### How it works

The THING table is the main focus of the database. Every entity should reference a record within said table.

If you want to create a Creative Work for example, you should first insert a Thing record, then a CreativeWork record referencing the Thing table through the idThing field.

Right now there's a field for things such as accountablePerson or associatedMedia, but since this only allows for one-to-one relationships this will be phased out and a Relationship will be implemented where one could specify two Thing objects and their relationship allowing for many-to-many relationships.